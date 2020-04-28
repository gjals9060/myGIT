package com.clover.p5.host.mapper;

import java.util.List;

import com.clover.p5.host.dto.*;

public interface HostMapper {

	HostInfoDTO selectHost(String id);
	
	List<HostInfoDTO> selectHostList(SearchHostDTO searchHostDto);
	
}
