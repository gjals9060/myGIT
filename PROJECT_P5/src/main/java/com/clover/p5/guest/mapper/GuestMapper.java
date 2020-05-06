package com.clover.p5.guest.mapper;

import java.util.Date;
import java.util.List;

import com.clover.p5.guest.dto.HostInfoDTO;
import com.clover.p5.guest.dto.HostPhotoDTO;
import com.clover.p5.guest.dto.SearchHostDTO;

public interface GuestMapper {


	HostInfoDTO selectHost(String id);
	
	List<HostInfoDTO> selectHostList(SearchHostDTO searchHostDto);

	List<HostPhotoDTO> selectHostPhoto(String hostId);
	
	List<Date> selectBlocking(String hostId);
	
	
}
