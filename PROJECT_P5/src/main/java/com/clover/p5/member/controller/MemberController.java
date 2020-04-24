package com.clover.p5.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.entity.Member;
import com.clover.p5.member.service.MemberService;



@SessionAttributes("newMember") // newMember라는 객체를 모델에 등록하면 session으로 관리하겠다
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	
	@ModelAttribute("newMember")
	public Member newMember() {
		return new Member();
	} // @SessionAttributes에 선언된 모델을 @ModelAttribute로 호출시 값이 없으면 에러가 나는데
	  // 이렇게 설정해주면 값이 없을 때만 return 값을 적용하여 모델을 생성해준다.
	
	
	
	@RequestMapping("/ajax/emailAuthentication") // 회원가입시 이메일 인증 + 유효성 검사
	@ResponseBody
	public String emailAuthentication(@ModelAttribute("newMember") Member member) {
		// 이메일을 발송하고 해시된 인증번호를 보내준다
		return memberService.sendEmailCode(member.getEmail());
	}
	
	
	
	@RequestMapping("/ajax/rerequest") // 인증번호 재전송
	@ResponseBody
	public String rerequestAuthenticationCode(@ModelAttribute("newMember") Member member) {
		// 이메일을 발송하고 해시된 인증번호를 보내준다
		return memberService.sendEmailCode(member.getEmail());
	}
	

	
	@RequestMapping("/ajax/completeSignUp") // 회원가입 완료(인증번호 일치 확인)
	@ResponseBody
	public boolean completeSignUp
		(@ModelAttribute("newMember") Member member, SessionStatus sessionStatus,
			String inputCode, String authenticationCode) {
		boolean isCorrectCode =
		memberService.checkEmailCode(inputCode, authenticationCode);
		
		if(isCorrectCode) { // 인증번호와 입력값이 일치하면
			if(memberService.insertMember(member)) { // DB에 회원정보를 잘 입력했으면
				sessionStatus.setComplete(); // 세션을 비워주고
				return true;
			}
		}
		return false;
	}
	
	
	
	
	
}
