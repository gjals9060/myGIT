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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.entity.Member;
import com.clover.p5.member.dto.ErrorFieldDTO;
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
	
	
	
	
	
	
	
	
	
	
	@Override
	public int signUp(HttpServletRequest req, SessionStatus sessionStatus) {
		String authenticationCode = req.getParameter("authenticationCode");
		String inputCode = req.getParameter("inputCode");
		NewMemberDTO newMemberDto = (NewMemberDTO) req.getSession().getAttribute("newMember");
		
		/***
		** 인증번호 입력값과 비교
		***/
			if(authenticationCode.isEmpty()) {
				return 0;
			}
			if(!passwordEncoder.matches(inputCode, authenticationCode)) {
				return 0;
			}
			
		/***
		** 통과했으면 DB에 정보를 저장
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
				sessionStatus.setComplete(); // 세션을 비워주고
				return 1;
			}
					
			System.out.println("회원정보 DB에 저장 실패");
			return 2;
	}
	
	
	
	
	@Override
	public String sendEmailCode(String email) {
		 String code = new Random().nextInt(900000) + 100000 + ""; // 6자리 숫자 난수 생성
		 String content = "이메일 인증번호는 " + code + "입니다~~";				// 100000 ~ 999999
		 String hashedCode = passwordEncoder.encode(code); // 인증번호 해싱
		 
		 MimeMessage message = javaMailSender.createMimeMessage();
         try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
            messageHelper.setSubject("p5입니다. 메일인증 하세요!"); // 메일제목은 생략이 가능하다
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


	








	@Override
	public int logIn(HttpServletRequest req) {
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		HttpSession session = req.getSession();
		
		Member member = memberMapper.selectMember(email);
		if(member == null) {
			return 0; // 없는 아이디
		}
		if(!passwordEncoder.matches(password, member.getPassword())) {
			return 1; // 비밀번호 불일치
		}
		session.setAttribute("userId", member.getId()); // 자주 쓰여서 따로 저장
		session.setAttribute("user", member); // 세션에 정보 저장
		return 2; // 로그인 성공
	}




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




	@Override
	public boolean isMobileAuthentication(int userId) {
		String result = memberMapper.selectMobileAuthentication(userId);
		if(result.equals("Y")) {
			return true;
		}
		return false;
	}




	@Override
	public int mobileAuthentication(HttpServletRequest req) {
		String authenticationCode = req.getParameter("authenticationCode");
		String inputCode = req.getParameter("inputCode");
		int userId = (int)req.getSession().getAttribute("userId");
		
		/***
		** 인증번호 입력값과 비교
		***/
			/*if(authenticationCode.isEmpty()) {
				return 0;
			}*/
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
			System.out.println("휴대전화 인증 결과를 DB에 적용 실패했습니다.");
			return 2;
	}




	@Override
	public String sendMobileCode(String mobileNumber) {
		String code = new Random().nextInt(900000) + 100000 + ""; // 6자리 숫자 난수 생성
		String content = "P5입니다^^ 휴대전화 인증번호는 " + code + "입니다~~";				// 100000 ~ 999999
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








	@Override
	public void refreshUserSession(HttpServletRequest req, int userId) {
		Member member = memberMapper.selectMemberById(userId);
		req.getSession().setAttribute("user", member); // session을 갱신
	}



	






	




	
	

	
}
