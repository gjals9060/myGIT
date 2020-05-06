package com.clover.p5.guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clover.p5.guest.service.GuestService;
import com.clover.p5.guest.dto.HostInfoDTO;
import com.clover.p5.guest.dto.ReservationInfoDTO;
import com.clover.p5.guest.dto.SearchInputDTO;

@Controller
public class GuestController {

	@Autowired
	private GuestService guestService;

	@ResponseBody
	@RequestMapping(value="/ajax/Hosts", method = RequestMethod.POST)
	public List<HostInfoDTO> ajaxMap(@RequestBody SearchInputDTO searchInputDto) {	
		return guestService.selectHostList(searchInputDto);
	}

	@RequestMapping("/reservationList")
	public String reservationList(HttpServletRequest request, Model model) {
		return guestService.reservationList(request, model);
	}
	
	@RequestMapping("/postPage")
	public String postPage(HttpServletRequest request, Model model) {	
		return guestService.selectHost(request, model);
	}
	
	@RequestMapping("/reservationPurchase")
	public String reservationPurchase(HttpServletRequest request, Model model) {	
		return guestService.reservationPurchase(request, model);
	}
	
	@RequestMapping(value = "/reservationFinish", method = RequestMethod.POST)
	public String reservationFinish(ReservationInfoDTO reservationInfoDTO, HttpServletRequest request, Model model) {	
		return guestService.reservationFinish(reservationInfoDTO, request, model);
	}
	
	
}
