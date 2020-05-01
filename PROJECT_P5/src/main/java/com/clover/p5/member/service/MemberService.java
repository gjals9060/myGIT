package com.clover.p5.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.member.dto.NewMemberDTO;

public interface MemberService {
	
	// 회원가입 정보 입력
	int signUp(String inputCode,
					String authenticationCode,
					NewMemberDTO newMemberDto,
					SessionStatus sessionStatus);
	
	// 로그인
	int logIn(String email, String password, HttpSession session);
	
	
	
	
	
	
	
	
	
	
	
	String sendEmailCode(String email); // 이메일 인증번호 발송
	
	
	
	
	
}
