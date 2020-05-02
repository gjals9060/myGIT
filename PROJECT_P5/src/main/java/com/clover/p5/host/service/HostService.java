package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.entity.NewHostDTO;
import com.clover.p5.host.dto.HostInfoDTO;
import com.clover.p5.host.dto.SearchInputDTO;

public interface HostService {
	
	// postPage이동(id로 host 검색)
	String selectHost(HttpServletRequest request, Model model);
	
	// 지도 반응형 리스트
	List<HostInfoDTO> selectHostList(SearchInputDTO searchInputDto);
	
	// reservationList 이동
	String reservationList(HttpServletRequest request, Model model);
	
	// reservaionPurchase 이동
	String reservationPurchase(HttpServletRequest request, Model model);
	
	
	
	
	
	
	// 아래부터 by 근형
	
	
	
	
	
	
	
	
	
	
	// 숙소 등록
	boolean insertHost(NewHostDTO newHostDto, HttpServletRequest request);
	
	// 호스트 사진(서버) 및 경로(DB) 저장
	boolean insertHostPhoto(int hostId, List<MultipartFile> photos, HttpServletRequest request);
	
	// 숙소 등록시 설정한 예약 차단일 저장
	boolean insertBlocking(int hostId, String blockingDate);
	
	
	
	
}
