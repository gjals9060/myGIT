package com.clover.p5.host.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.host.dto.HostPhoto;
import com.clover.p5.host.dto.HostPhotoVO;
import com.clover.p5.host.dto.NewHostDTO;

public interface HostMapper {


	// 호스트 등록 1단계 마침
	int insertHost(NewHostDTO newHost); // session에 모은 정보로 호스트 등록(DB에 저장)
	int selectNewHostId(int memberId); // 작성자 ID로 새로 등록한 호스트 ID를 검색한다
	
	
	
	
	
	
	
	
	
	
	// 호스트 사진 목록 검색
	List<HostPhoto> selectHostPhotoList(int hostId);
	// 호스트 사진 등록 전 사전 작업?
	int selectHostPhotoCount(int hostId);
	int selectHostPhotoSortOrderMax(int hostId);
	// 호스트 사진 등록
	int insertHostPhoto(List<HostPhotoVO> photoList);
	// 호스트 사진 삭제
	int deleteHostPhoto(int hostPhotoId);
	// 호스트 사진 드래그 순서 변경 결과 저장
	int updateHostPhotoSort(int[] sortResult);
	// 호스트 대표 사진 바꾸기에 사용
	int updateHostPhoto(
			@Param("photoId") int photoId,
			@Param("sortOrder") int sortOrder);
			
			
	
	
	
	/*
	int insertBlocking(
			@Param("hostId") int hostId,
			@Param("arrBlockingDate") String[] arrBlockingDate);*/	
	
	
	
	
	
	
}
