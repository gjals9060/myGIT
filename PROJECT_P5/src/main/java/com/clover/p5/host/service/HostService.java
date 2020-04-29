package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.VO.HostParamVO;
import com.clover.p5.entity.Host;
import com.clover.p5.entity.NewHostDTO;

public interface HostService {
	
	// service - mapper 예시
	String selectHost();
	
	// 지도 반응형 리스트
	List<Host> selectHostList(HostParamVO vo);
	
	// reservationList 이동
	String reservationList(HttpServletRequest request, Model model);
	
	
	
	
	
	
	
	
	
	
	// 숙소 등록
	boolean insertHost(NewHostDTO newHostDto);
	
	// 호스트 사진(서버) 및 경로(DB) 저장
	boolean insertHostPhoto(int hostId, List<MultipartFile> photos);
	
	// 숙소 등록시 설정한 예약 차단일 저장
	boolean insertBlocking(int hostId, String blockingDate);
	
	
	
	
}
