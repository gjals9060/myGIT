package com.clover.p5.guest.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.clover.p5.guest.dto.HostInfoDTO;
import com.clover.p5.guest.dto.HostSemiInfoDTO;
import com.clover.p5.guest.dto.BookingEntity;
import com.clover.p5.guest.dto.SearchInputDTO;

public interface GuestService {

	// postPage이동(id로 host 검색)
	String selectHost(HttpServletRequest request, Model model);
	
	// 지도 이동 반응형 리스트
	List<HostSemiInfoDTO> selectHostList(SearchInputDTO searchInputDto);
	
	// reservationList 이동
	String reservationList(HttpServletRequest request, Model model);
	
	// reservaionPurchase 이동
	String reservationPurchase(HttpServletRequest request, Model model);
	
	// reservationFinish 이동
	String reservationFinish(BookingEntity booking, HttpServletRequest request, Model model);
	
	// userInfoReservationList 이동
	ModelAndView userInfoReservationList(HttpServletRequest request, ModelAndView mv);
	
	// 환불처리
	boolean refund(String sBookingId, String hostId, String sCheckInDate, String sCheckOutDate, String sPayment);
	//boolean refund(BookingEntity bookingEntity);
	
}
