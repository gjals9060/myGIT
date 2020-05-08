package com.clover.p5.member.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.clover.p5.member.dto.ErrorFieldDTO;
import com.clover.p5.member.dto.Member;
import com.clover.p5.member.dto.NewMemberDTO;
import com.clover.p5.member.mapper.MemberMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	
	
	
	
	
	
//******************************** 인증 이메일 전송 ********************************************
	@Override
	public String sendEmailCode(String email) {
			// 6자리 숫자 난수 생성(100000 ~ 999999)
		 String code = new Random().nextInt(900000) + 100000 + "";
		 String content = "이메일 인증번호는 " + code + "이며 인증번호를 입력하시면 회원가입을 완료하실 수 있습니다^^";				
		 String hashedCode = passwordEncoder.encode(code); // 인증번호 해싱
		 
		 MimeMessage message = javaMailSender.createMimeMessage();
         try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
            messageHelper.setSubject("P5 이메일 인증 안내드립니다."); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            messageHelper.setFrom("p5.email.authentication"); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(email); // 받는사람 이메일
            
            javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return ""; // 메일 발송 실패
		}
         
         return hashedCode;
	}
//******************************** 인증 이메일 전송-END ********************************************
	
	
	
//******************************** 이메일 인증 ********************************************
	public boolean emailAuthentication(HttpServletRequest req) {
		String authenticationCode = req.getParameter("authenticationCode");
		String inputCode = req.getParameter("inputCode");
		
		/***
		** 인증번호 입력값과 비교
		***/
			if(authenticationCode.isEmpty()) {
				return false;
			}
			if(!passwordEncoder.matches(inputCode, authenticationCode)) {
				return false;
			}
		
		return true;
	}
//******************************** 이메일 인증-END ******************************************
	
	
	
	
//****************************** 회원 가입 **************************************************	
	@Override
	public boolean signUp(NewMemberDTO newMemberDto) {
		/***
		** 회원 정보를 DB에 저장
		***/
			newMemberDto.setPassword( // DB에 저장 전에 암호 해시화
					passwordEncoder.encode(newMemberDto.getPassword())
			);
			// 서버시간에 서울의 타임존을 적용한 DateTime을 얻는다
			ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
			newMemberDto.setRegistrationDate( // 필요한 형식으로 변경하여 세팅
					nowSeoul.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
			);
			if(memberMapper.insertMember(newMemberDto) == 1) { // DB에 저장
				System.out.println("회원가입 완료^^");
				return true;
			}
					
			System.out.println("회원정보 DB에 저장 실패");
			return false;
	}
//****************************** 회원 가입-END **************************************************		
	
	

	
	
	


	





//******************************** 로그인 ********************************************
	@Override
	public int logIn(HttpServletRequest req, HttpServletResponse res) {
	
	/***
	** 쿠키 테스트
	***/
		String sessionId = req.getSession().getId();
		System.out.println(sessionId);
		
		Cookie cookie = new Cookie("cookieTest", "dmdkdkdkdkdkdkdkdk");
		
		cookie.setPath("/");
        cookie.setMaxAge(60*60*24*7);
        

		String rememberMe = req.getParameter("rememberMe");
		if(rememberMe.equals("true")) {
			System.out.println("자동 로그인에 체크하셨군요?");
			
			res.addCookie(cookie);
		}
		
		
//***************************************************************************************
		String userEmail = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		
		Member member = memberMapper.selectMemberByEmail(userEmail);
		
		if(member == null) {
			return 0; // 없는 아이디
		}
		if(!passwordEncoder.matches(password, member.getPassword())) {
			return 1; // 비밀번호 불일치
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", member); // 세션에 정보 저장
		
		session.setAttribute("userId", member.getId()); // 자주 쓰여서 따로 저장
		return 2; // 로그인 성공
	}
//******************************** 로그인-END ********************************************

	
	
	
	
	
	
	
	
//******************************** 임시 비밀번호 발급 ***************************************	
	@Override
	public String sendTemporaryPassword(String userEmail) {
			// 16자리 숫자, 영문 대, 소문자 조합 난수 생성
		String temporaryPassword = randomPassword(16);
		System.out.println("임시 비밀번호 생성 - " + temporaryPassword);
		
		String content = "임시 비밀번호는 " + temporaryPassword + "이며"
						+ " 발급 화면에서만 유효함을 알려드립니다. 발급 화면에서 임시 비밀번호를 통해 로그인할 경우,"
						+ " 계정의 비밀번호는 로그인에 사용된 임시 비밀번호로 변경되며 이후에 꼭 비밀번호 변경을 통해"
						+ " 보안에 신경쓰실 것을 권고드립니다.";
		
		String hashedPassword = passwordEncoder.encode(temporaryPassword); // 임시 비밀번호 해싱
		 
		MimeMessage message = javaMailSender.createMimeMessage();
        try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
           messageHelper.setSubject("P5에서 임시 비밀번호 발급 안내드립니다."); // 메일제목은 생략이 가능하다
           messageHelper.setText(content); // 메일 내용
           messageHelper.setFrom("p5.email.temporary-password"); // 보내는사람 생략하면 정상작동을 안함
           messageHelper.setTo(userEmail); // 받는사람 이메일
           
           javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("임시 비밀번호 발급(메일 발송) 실패");
			return ""; // 메일 발송 실패
		}
        
        return hashedPassword;
	}
//******************************** 임시 비밀번호 발급-END ***********************************
	
	
//******************************** 임시 로그인 ********************************************
	@Override
	public boolean temporaryLogIn(HttpServletRequest req) {
			// 로그인 하려는 계정
		String userEmail = req.getParameter("userEmail");
			// 임시 로그인 화면에서 입력한 비밀번호
		String inputPassword = req.getParameter("inputTemporaryPassword");
			// 임시 로그인 화면에서만 유효한 임시 비밀번호(해싱)
		String temporaryPassword = req.getParameter("temporaryPassword");
		
	/***
	** 입력 값과 임시 비밀번호를 비교
	***/
		if(!passwordEncoder.matches(inputPassword, temporaryPassword)) {
			return false; // 불일치
		}
		
	/***
	** 일치하면 해싱된 임시비밀번호로 비밀번호를 변경한다.
	***/
		int userId = memberMapper.selectMemberId(userEmail);
		if(memberMapper.updatePassword(userId, temporaryPassword) == 1) {
			System.out.println("임시비밀번호를 비밀번호로 변경했습니다.");
		}
		
	/***
	** 갱신된 회원정보(비밀번호 변경)를 session에 등록한다. - 로그인
	***/
		Member member = memberMapper.selectMember(userId);
		
		HttpSession session = req.getSession();
		session.setAttribute("user", member); // 세션에 정보 저장
		
		session.setAttribute("userId", member.getId()); // 자주 쓰여서 따로 저장
		return true; // 로그인 성공
	}
//******************************** 임시 로그인-END ******************************************
	
	
//******************************** 비밀번호 변경 ********************************************
	@Override
	public int updateUserPassword(HttpServletRequest req) {
		String userPassword = req.getParameter("userPassword");
		String newPassword = req.getParameter("newPassword");
		int userId = (int)req.getSession().getAttribute("userId");
		
		Member member = memberMapper.selectMember(userId);
		if(!passwordEncoder.matches(userPassword, member.getPassword())) {
			System.out.println("기존 비밀번호 불일치");
			return 0; // 비밀번호 불일치
		}
			// 해싱값을 DB에 저장한다.
		String HashedNewPassword = passwordEncoder.encode(newPassword);
		if(memberMapper.updatePassword(userId, HashedNewPassword) == 1) {
			System.out.println("비밀번호 변경 완료");
			return 1;
		}
		
		System.out.println("비밀번호 변경 실패");
		return 2;
	}
//******************************** 비밀번호 변경-END ********************************************
	
	
	
	
	
	
	
	
	
	
	

//******************************** 휴대전화 인증 여부 확인 ********************************************
	@Override
	public boolean isMobileAuthentication(HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		String result = memberMapper.selectMobileAuthentication(userId);
		if(result.equals("Y")) {
			return true;
		}
		return false;
	}
//******************************** 휴대전화 인증 여부 확인-END ********************************************
	
	
//******************************** 인증 문자메세지 전송 ********************************************
	@Override
	public String sendMobileCode(String mobileNumber) {
			// 6자리 숫자 난수 생성(100000 ~ 999999)
		String code = new Random().nextInt(900000) + 100000 + "";
		String content = "P5입니다^^ 휴대전화 인증번호는 다음과 같습니다 - " + code;
		String hashedCode = passwordEncoder.encode(code); // 인증번호 해싱
		
		String apiKey = "NCS9FLMUM2URIAA9";
	    String apiSecret = "GOOZEG4YKEZFLWDTBCUPWCRTIGTREH3S";
	    Message coolsms = new Message(apiKey, apiSecret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", mobileNumber); // 수신번호
	    params.put("from", "01099641539"); // 발신번호
	    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
	    params.put("text", content); // 문자내용    
	    
	    // 적용이 안된다..
	    params.put("mode", "test"); // 'test' 모드. 실제로 발송되지 않으며 전송내역에 60 오류코드로 뜹니다. 차감된 캐쉬는 다음날 새벽에 충전 됩니다.
	   // params.put("app_version", "JAVA SDK v1.2"); // application name and version

	    // Optional parameters for your own needs
	    // params.put("image", "desert.jpg"); // image for MMS. type must be set as "MMS"
	    // params.put("image_encoding", "binary"); // image encoding binary(default), base64 
	    // params.put("delay", "10"); // 0~20사이의 값으로 전송지연 시간을 줄 수 있습니다.
	    // params.put("force_sms", "true"); // 푸시 및 알림톡 이용시에도 강제로 SMS로 발송되도록 할 수 있습니다.
	    // params.put("refname", ""); // Reference name
	    // params.put("country", "KR"); // Korea(KR) Japan(JP) America(USA) China(CN) Default is Korea
	    // params.put("sender_key", "5554025sa8e61072frrrd5d4cc2rrrr65e15bb64"); // 알림톡 사용을 위해 필요합니다. 신청방법 : http://www.coolsms.co.kr/AboutAlimTalk
	    // params.put("template_code", "C004"); // 알림톡 template code 입니다. 자세한 설명은 http://www.coolsms.co.kr/AboutAlimTalk을 참조해주세요. 
	    // params.put("datetime", "20140106153000"); // Format must be(YYYYMMDDHHMISS) 2014 01 06 15 30 00 (2014 Jan 06th 3pm 30 00)
	    // params.put("mid", "mymsgid01"); // set message id. Server creates automatically if empty
	    // params.put("gid", "mymsg_group_id01"); // set group id. Server creates automatically if empty
	    // params.put("subject", "Message Title"); // set msg title for LMS and MMS
	    // params.put("charset", "euckr"); // For Korean language, set euckr or utf-8
	    // params.put("app_version", "Purplebook 4.1") // 어플리케이션 버전

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	      
	      // 잔액 확인..
	      obj = (JSONObject) coolsms.balance();
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	      return "";
	    }
		return hashedCode;
	}
//******************************** 인증 문자메세지 전송-END ********************************************

	
//******************************** 휴대전화 인증 ********************************************
	@Override
	public int mobileAuthentication(HttpServletRequest req) {
		String authenticationCode = req.getParameter("authenticationCode");
		String inputCode = req.getParameter("inputCode");
		int userId = (int)req.getSession().getAttribute("userId");
		
		/***
		** 인증번호 입력값과 비교
		***/
			if(!passwordEncoder.matches(inputCode, authenticationCode)) {
				return 0;
			}
			
		/***
		** 통과했으면 DB에 결과를 적용
		***/
			if(memberMapper.updateMobileAuthentication(userId) == 1) {
				refreshUserSession(req, userId); // session 새로고침
				System.out.println("휴대전화 인증 결과를 DB에 적용했습니다.");
				return 1;
			}
			System.out.println("휴대전화 인증 결과를 DB에 적용하지 못했습니다.");
			return 2;
	}
//******************************** 휴대전화 인증-END ********************************************

	
	
	
	
	
	

	
	
	
	
	





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//******************************** 임시 비밀번호 생성 ********************************************	
	@Override
	public String randomPassword(int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J','K','L','M'
				,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
				,'a','b','c','d','e','f','g','h','i','j','k','l','m'
				,'n','o','p','q','r','s','t','u','v','w','x','y','z'};
		
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<length; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		
		return sb.toString();
	}
//******************************** 임시 비밀번호 생성-END ********************************************


//******************************** session 갱신 ********************************************
	@Override
	public void refreshUserSession(HttpServletRequest req, int userId) {
		Member member = memberMapper.selectMember(userId);
		req.getSession().setAttribute("user", member); // session을 갱신
		System.out.println("session 갱신 완료.");
	}
//******************************** session 갱신-END ********************************************

	
	
//******************************** 백엔드 유효성 검사 결과 ********************************************
	@Override
	public List<ErrorFieldDTO> validationResult(Errors errors) {
		ArrayList<ErrorFieldDTO> list = new ArrayList<>();
		
		if(errors.hasErrors()) {
			for(FieldError error : errors.getFieldErrors()) {
				String name = error.getField();
				String message = error.getDefaultMessage();
				ErrorFieldDTO dto = new ErrorFieldDTO(name, message);
				System.out.println(dto);
				
				list.add(dto);
			}
		}
		System.out.println("유효성 검사 탈락 : " + list.size() + "건");
        return list;
	}
//******************************** 백엔드 유효성 검사 결과-END ********************************************


	
	

	

	
	



	
	

	
}
