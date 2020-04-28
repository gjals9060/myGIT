package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.clover.p5.host.dto.*;

public interface HostService {
	
	// postPage이동(id로 host 검색)
	String selectHost(HttpServletRequest request, Model model);
	
	// 지도 반응형 리스트
	List<HostInfoDTO> selectHostList(SearchInputDTO searchInputDto);
	
	// reservationList 이동
	String reservationList(HttpServletRequest request, Model model);
	
	// reservaionPurchase 이동
	String reservationPurchase(HttpServletRequest request, Model model);
	
}
