package com.clover.p5.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.entity.Member;
import com.clover.p5.member.service.MemberService;



@Controller
@SessionAttributes("newMember") // newMember라는 객체를 모델에 등록하면 session으로 관리하겠다
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@ModelAttribute("newMember")
	public Member newMember() {
		return new Member();
	} // @SessionAttributes에 선언된 모델을 @ModelAttribute로 호출시 값이 없으면 에러가 나는데
	  // 이렇게 설정해주면 값이 없을 때만 return 값을 적용하여 모델을 생성해준다.
	
	@RequestMapping("/signUp2")
	public String goSignUp2(@ModelAttribute("newMember") Member member) {
	//	model.addAttribute("newMember", member);
		return "emailAuthentication";
	}
	
	@RequestMapping("/signUp3")
	public String completeSignUp(@ModelAttribute("newMember") Member member, SessionStatus session) {
		if(memberService.insertMember(member)) {
			session.setComplete();
			return "success";
		}
		return "fail";
	}
	
	
	
	
	
}
