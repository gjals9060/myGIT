package com.clover.p5.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.Errors;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.member.dto.ErrorFieldDTO;

public interface MemberService {
	
	
	
	// 이메일 인증번호 발송
	String sendEmailCode(String email);
	
	// 회원가입(DB에 정보 입력)
	int signUp(HttpServletRequest req, SessionStatus sessionStatus);
		
	// 로그인
	int logIn(HttpServletRequest req, HttpServletResponse res);
	
	
	
	
	
	
	
	
	
	// 임시 비밀번호 생성
	String randomPassword(int length);
	
	// 이메일로 임시 비밀번호 발급
	String sendTemporaryPassword(String userEmail);
		
	// 임시 로그인
	boolean temporaryLogIn(HttpServletRequest req);
	
	// 비밀번호 변경
	int updateUserPassword(HttpServletRequest req);
	
	
	
	
	
	
	// 휴대전화 인증여부 확인
	boolean isMobileAuthentication(HttpSession session);
	
	// 휴대전화 인증번호 발송
	String sendMobileCode(String mobileNumber);
	
	// 휴대전화 인증(인증번호 확인 + 결과 DB에 적용)
	int mobileAuthentication(HttpServletRequest req);
	
	
	
	
	
	
	
	
	
	
	
	
	
	// user session 갱신
	void refreshUserSession(HttpServletRequest req, int userId);
	
	// 유효성 검사 결과를 정리
	List<ErrorFieldDTO> validationResult(Errors errors);
	
	
}
