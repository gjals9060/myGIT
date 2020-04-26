package com.clover.p5.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.clover.p5.entity.Member;
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
	public boolean insertMember(Member member) {
		member.setPassword( // DB에 저장 전에 암호 해시화
				passwordEncoder.encode(member.getPassword())
		);
		if(memberMapper.insertMember(member) == 1) {
			return true;
		}
		return false;
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
	public boolean checkEmailCode(String inputCode, String authenticationCode) {
		return passwordEncoder.matches(inputCode, authenticationCode);
	}








	@Override
	public int logIn(String email, String password, HttpSession session) {
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
	
	

	
}
