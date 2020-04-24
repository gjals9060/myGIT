package com.clover.p5.member.service;

import com.clover.p5.entity.Member;

public interface MemberService {

	boolean insertMember(Member member); // 회원가입 정보 입력
	
	
	
	
	
	
	String sendEmailCode(String email); // 이메일 인증번호 발송
	
	boolean checkEmailCode(String inputCode, String authenticationCode); // 이메일 인증번호 확인
	
	
	
	
}
