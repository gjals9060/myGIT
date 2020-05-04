package com.clover.p5.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.Errors;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.member.dto.ErrorFieldDTO;

public interface MemberService {
	
	
	
	// 이메일 인증번호 발송
	String sendEmailCode(String email);
	
	// 회원가입(DB에 정보 입력)
	int signUp(HttpServletRequest req, SessionStatus sessionStatus);
	
	
	
	
	
	
	
	// 로그인
	int logIn(HttpServletRequest req);
	
	
	
	
	
	
	// 휴대전화 인증여부 확인
	boolean isMobileAuthentication(int userId);
	
	// 휴대전화 인증번호 발송
	String sendMobileCode(String mobileNumber);
	
	// 휴대전화 인증(인증번호 확인 + 결과 DB에 적용)
	int mobileAuthentication(HttpServletRequest req);
	
	
	
	
	
	
	
	
	
	
	
	
	
	// user session 새로고침
	void refreshUserSession(HttpServletRequest req, int userId);
	
	// 유효성 검사 결과를 정리
	List<ErrorFieldDTO> validationResult(Errors errors);
	
	
}
