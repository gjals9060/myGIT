package com.clover.p5.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.member.dto.NewMemberDTO;
import com.clover.p5.member.service.MemberService;



@SessionAttributes("newMember") // newMember라는 객체를 모델에 등록하면 session으로 관리하겠다
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	
	@ModelAttribute("newMember")
	public NewMemberDTO newMember() {
		return new NewMemberDTO();
	} // @SessionAttributes에 선언된 모델을 @ModelAttribute로 호출시 값이 없으면 에러가 나는데
	  // 이렇게 설정해주면 값이 없을 때만 return 값을 적용하여 모델을 생성해준다.
	
	
	
	@RequestMapping("/ajax/emailAuthentication") // 회원가입시 이메일 인증 + 유효성 검사
	@ResponseBody
	public String emailAuthentication(@ModelAttribute("newMember") NewMemberDTO newMemberDto) {
		// 이메일을 발송하고 해시된 인증번호를 보내준다
		return memberService.sendEmailCode(newMemberDto.getEmail());
	}
	
	
	
	@RequestMapping("/ajax/rerequest") // 인증번호 재전송
	@ResponseBody
	public String rerequestAuthenticationCode(@ModelAttribute("newMember") NewMemberDTO newMemberDto) {
		// 이메일을 발송하고 해시된 인증번호를 보내준다
		return memberService.sendEmailCode(newMemberDto.getEmail());
	}
	

	
	@RequestMapping("/ajax/completeSignUp") // 회원가입 완료(인증번호 일치 확인)
	@ResponseBody
	public int completeSignUp
		(@ModelAttribute("newMember") NewMemberDTO newMemberDto, SessionStatus sessionStatus,
			String inputCode, String authenticationCode) {
		return memberService.signUp(inputCode, authenticationCode, newMemberDto, sessionStatus);
	}
	
	@RequestMapping("/ajax/logIn")
	@ResponseBody
	public int logIn(String userEmail, String userPassword, HttpSession session) {
		return memberService.logIn(userEmail, userPassword, session);
	}
	
	@RequestMapping("/ajax/logOut")
	@ResponseBody
	public void logOut(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return;
	}
	
	
	
	
	
}
