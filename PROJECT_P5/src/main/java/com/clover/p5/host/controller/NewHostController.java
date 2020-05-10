package com.clover.p5.host.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.clover.p5.host.dto.NewHostDTO;
import com.clover.p5.host.service.HostService;



@SessionAttributes("newHost")
@Controller
public class NewHostController {
	
	@Autowired
	private HostService hostService;
	
	
	
	@ModelAttribute("newHost")
	public NewHostDTO newHost(@SessionAttribute("userId") int memberId) {
		return new NewHostDTO(memberId);
	}
		// 화면에 갱신된 내용을 적용 - AJAX
	@RequestMapping("/host/registration/refresh/newHost")
	@ResponseBody
	public NewHostDTO refresh(@ModelAttribute("newHost") NewHostDTO newHost) {
		System.out.println("=============== 화면을 갱신합니다 ===============");
		System.out.println(newHost);
		System.out.println("===================================================\n");
		return newHost;
	}
		// 화면 전환(페이지 이동)시 입력한 정보를 저장 - AJAX
	@RequestMapping("/host/registration/save/newHost")
	@ResponseBody
	public void save(@ModelAttribute("newHost") NewHostDTO newHost, HttpServletRequest request) {
		System.out.println("============== newHost 세션에 정보를 저장 ===============");
		Set<String> keySet = request.getParameterMap().keySet();
		for(String key: keySet) {System.out.println(key + ": " + request.getParameter(key));}
		System.out.println("=======================================================\n");
	}
	
//************************** 호스트 등록 1단계(완료하면 DB에 저장) ******************************
	
		// '새로 등록'을 선택 - 첫 화면으로 이동 전에 세션을 초기화
	@RequestMapping("/host/registration/reset")
	public String reset(SessionStatus status) {
		status.setComplete(); // 세션(newHost) 초기화
		System.out.println("새 호스트 등록을 위한 세션(newHost) 초기화 완료.");
		return "redirect:registration/roomType";
	}
		// roomType.jsp로 이동
	@RequestMapping("/host/registration/roomType")
	public String roomType() {
		return "host/registration/step1/roomType";
	}
		// roomCount.jsp로 이동
	@RequestMapping("/host/registration/roomCount")
	public String roomCount() {
		return "host/registration/step1/roomCount";
	}
		// address.jsp로 이동
	@RequestMapping("/host/registration/address")
	public String address() {
		return "host/registration/step1/address";
	}
		// facilities.jsp로 이동
	@RequestMapping("/host/registration/facilities")
	public String facilities() {
		return "host/registration/step1/facilities";
	}
		// 1단계 등록을 완료하면 DB에 저장
	@RequestMapping("/host/registration/step1/complete")
	public String inputFacilities
	(@ModelAttribute("newHost") NewHostDTO newHost, SessionStatus status) {
		
		
		// DB에 저장하고 hostId 받아서 넘기기
		// 서비스 로직에서 처리
		
		return "redirect:host/hostingStatus?";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*@RequestMapping("/host/registration/description") // 사진 저장
	public void inputPhoto(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto + "\n사진 " + newHostDto.getPhoto().size() + "개 넘어옴");
		for(int i = 0; i < newHostDto.getPhoto().size(); i++) {
			if(newHostDto.getPhoto().get(i).isEmpty()) {
				System.out.println(i+1+"번째 파일이 비었습니다.");
			}
		}
	}
	@RequestMapping("/host/registration/stayDate") // 설명 저장
	public void inputDescription(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/calendar") // 숙박일 저장
	public void inputStayDate(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/price") // 달력 저장
	public void inputCalendar(@ModelAttribute("newHost") NewHostDTO newHostDto) {
		System.out.println(newHostDto);
	}
	@RequestMapping("/host/registration/finish") // 가격 저장
	public void inputPrice
	(@ModelAttribute("newHost") NewHostDTO newHostDto, SessionStatus sessionStatus, HttpServletRequest request) {
		System.out.println(newHostDto);
		if(hostService.insertHost(newHostDto, request)) {
			sessionStatus.setComplete(); // 호스트 등록 세션 초기화
			System.out.println("호스트 등록 성공!");
		}
	}
	
	*/
	
	
	

}
