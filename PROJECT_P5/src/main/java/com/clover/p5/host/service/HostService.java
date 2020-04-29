package com.clover.p5.host.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.VO.HostParamVO;
import com.clover.p5.entity.Host;
import com.clover.p5.entity.NewHostDTO;

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
	boolean insertHost(NewHostDTO newHostDto);
	
	// 서버에 호스트 사진 등록
	boolean storePhoto(String lastFolderName, List<MultipartFile> photos);
	
	// 숙소 등록시 설정한 예약불가 날짜 입력
	int insertBlocking(int memberId, String blockingDate);
	
	
	
	
}
