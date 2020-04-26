package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.clover.p5.VO.HostParamVO;
import com.clover.p5.entity.Host;

public interface HostService {
	
	// service - mapper 예시
	String selectHost();
	
	// 지도 반응형 리스트
	List<Host> selectHostList(HostParamVO vo);
	
	// reservationList 이동
	String reservationList(HttpServletRequest request, Model model);
	
	
}
