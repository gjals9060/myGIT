package com.clover.p5.host.mapper;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.host.dto.NewHostDTO;

public interface HostMapper {

	// 아래부터 by 근형

	
	int insertHost(NewHostDTO newHostDto); // session에 모은 정보로 호스트 등록(DB에 저장)
	
	int selectNewHostId(int memberId); // 작성자 id로 방금 작성한 host id를 검색한다
	
	int insertHostPhoto(
			@Param("hostId") int hostId,
			@Param("originalName") String originalName,
			@Param("fileSize") long fileSize,
			@Param("path") String path);
	
	int insertBlocking(
			@Param("hostId") int hostId,
			@Param("arrBlockingDate") String[] arrBlockingDate);	
}
