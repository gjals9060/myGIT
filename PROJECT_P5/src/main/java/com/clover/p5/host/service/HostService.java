package com.clover.p5.host.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.clover.p5.host.dto.HostPhoto;
import com.clover.p5.host.dto.NewHostDTO;

public interface HostService {
	
	
	// 숙소 등록 1단계 완료
	int completeStep1(NewHostDTO newHost);
	

	
	
	
	
	// 호스트 사진 목록 가져오기
	List<HostPhoto> getHostPhotoList(int hostId);
	
	// 호스트 사진(서버) 및 경로(DB) 저장
	boolean insertHostPhoto(int hostId, List<MultipartFile> photos, HttpServletRequest req);
	
	// 호스트 사진 삭제
	boolean deleteHostPhoto(int hostPhotoId);
	
	// 호스트 사진 정렬 결과 저장
	int updateHostPhotoSort(int[] sortResult);
	
	// 호스트 사진 대표 이미지 변경
	boolean changeCoverImage(HttpServletRequest req);
	
	
	
	
	
	
	
	
	// 숙소 등록시 설정한 예약 차단일 저장
	/*boolean insertBlocking(int hostId, String blockingDate);*/
	
	
	
	
}
