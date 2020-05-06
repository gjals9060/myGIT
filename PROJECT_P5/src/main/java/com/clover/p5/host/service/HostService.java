package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.NewHostDTO;

public interface HostService {
	
	
	
	
	
	// 숙소 등록
	boolean insertHost(NewHostDTO newHostDto, HttpServletRequest request);
	
	// 호스트 사진(서버) 및 경로(DB) 저장
	boolean insertHostPhoto(int hostId, List<MultipartFile> photos, HttpServletRequest request);
	
	// 숙소 등록시 설정한 예약 차단일 저장
	boolean insertBlocking(int hostId, String blockingDate);
	
	
	
	
}
