package com.clover.p5.host.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.DTO.SearchHostDTO;
import com.clover.p5.entity.Host;
import com.clover.p5.entity.NewHostDTO;

public interface HostMapper {

	String selectHost();
	
	List<Host> selectHostList(SearchHostDTO dto);

	
	
	
	
	
	
	
	
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
