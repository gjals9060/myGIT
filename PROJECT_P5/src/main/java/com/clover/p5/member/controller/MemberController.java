package com.clover.p5.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.member.dto.ErrorFieldDTO;
import com.clover.p5.member.dto.NewMemberDTO;
import com.clover.p5.member.service.MemberService;



@SessionAttributes("newMember") // newMember라는 객체를 모델에 등록하면 session으로 관리하겠다
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
//********************************** 회원가입 ******************************************
	@ModelAttribute("newMember")
	public NewMemberDTO newMember() {
		return new NewMemberDTO();
	} // @SessionAttributes에 선언된 모델을 @ModelAttribute로 호출시 값이 없으면 에러가 나는데
	  // 이렇게 설정해주면 값이 없을 때만 return 값을 적용하여 모델을 생성해준다.
	
	@RequestMapping("/ajax/validateSignUp") // 유효성 검사
	@ResponseBody
	public List<ErrorFieldDTO> validateSignUp
	(@ModelAttribute("newMember") @Valid NewMemberDTO newMemberDto, Errors errors) {
		System.out.println(newMemberDto);
		return memberService.validationResult(errors);
	}
	
	@RequestMapping("/ajax/sendEmailAuthenticationCode") // 인증메일 발송
	@ResponseBody // 이메일을 발송하고 해시된 인증번호를 반환한다.
	public String sendEmailAuthenticationCode(@ModelAttribute("newMember") NewMemberDTO newMemberDto) {
		return memberService.sendEmailCode(newMemberDto.getEmail());
	}
	
	@RequestMapping("/ajax/completeSignUp") // 회원가입 완료
	@ResponseBody // 입력한 인증번호의 일치여부를 확인하고 회원정보를 DB에 저장한다.
	public int completeSignUp
		(HttpServletRequest req, SessionStatus sessionStatus) {
		return memberService.signUp(req, sessionStatus);
	}
//********************************** 회원가입-END ******************************************	
	
	
	
	
	
	
//********************************** 로그인, 로그아웃 ******************************************	
	@RequestMapping("/ajax/logIn") // 로그인
	@ResponseBody // 입력한 정보를 토대로 로그인을 시도하여 결과를 반환한다.
	public int logIn(HttpServletRequest req) {
		return memberService.logIn(req);
	}
	
	@RequestMapping("/ajax/logOut") // 로그아웃
	@ResponseBody // 세션을 초기화한다.
	public void logOut(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return;
	}
//********************************** 로그인, 로그아웃-END ******************************************	
	
	
	
	
	
	
//********************************** 휴대전화 인증 ******************************************	
	@RequestMapping("/ajax/isMobileAuthentication")
	@ResponseBody
	public boolean isMobileAuthentication(HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		return memberService.isMobileAuthentication(userId);
	}
	
	@RequestMapping("/ajax/sendMobileAuthenticationCode")
	@ResponseBody
	public String sendMobileAuthenticationCode(String mobileNumber) {
		return memberService.sendMobileCode(mobileNumber);
	}
	
	@RequestMapping("/ajax/completeMobileAuthentication")
	@ResponseBody
	public int completeMobileAuthentication(HttpServletRequest req) {
		return memberService.mobileAuthentication(req);
	}
//********************************** 휴대전화 인증-END ******************************************
	
	
	
	
	
	
	
	
}
