package com.clover.p5.member.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		 String content = "인증번호는 " + code + "입니다~~";				// 100000 ~ 999999
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










	




	
	

	
}
