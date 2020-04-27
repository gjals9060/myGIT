package com.clover.p5.host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.clover.p5.host.model.HostParamVO;
import com.clover.p5.entity.Host;
import com.clover.p5.host.service.HostService;

@SessionAttributes("newHost")
@Controller
public class HostController {
	
	@Autowired
	private HostService hostService;

	@ResponseBody
	@RequestMapping(value="/ajax/Hosts", method = RequestMethod.POST)
	public List<Host> ajaxMap(@RequestBody HostParamVO hostParamVO) {	
		return hostService.selectHostList(hostParamVO);
	}

	@RequestMapping("/reservationList")
	public String reservationList(HttpServletRequest request, Model model) {
		return hostService.reservationList(request, model);
	}
	
	@RequestMapping("/postPage")
	public String postPage(HttpServletRequest request, Model model) {	
		return hostService.selectHost(request, model);
	}
	
	
	
	
	
	
	
	
	
	
	
///////////////////////////// 호스트 등록 ////////////////////////////////	
	@ModelAttribute("newHost")
	public Host newHost() {
		return new Host();
	}
	@RequestMapping("/host/registration/roomType") // 등록 첫 페이지 - 단순 이동
	public void inputRoomType() {}
	
	 /////////////// 이때부터 세션에 정보를 저장 ////////////////
	@RequestMapping("/host/registration/roomCount") // 룸타입 저장
	public void inputRoomType(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/address") // 룸카운트 저장
	public void inputRoomCount(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/facilities") // 주소 저장
	public void inputAddress(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/photo") // 편의시설 저장
	public void inputFacilities(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/description") // 사진 저장
	public void inputPhoto(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/stayDate") // 설명 저장
	public void inputDescription(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/calendar") // 숙박일 저장
	public void inputStayDate(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/price") // 달력 저장
	public void inputCalendar(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	@RequestMapping("/host/registration/finish") // 가격 저장
	public void inputPrice(@ModelAttribute("newHost") Host host) {
		System.out.println(host);
	}
	
	
	
	
	
	
	
	
	
	
}
