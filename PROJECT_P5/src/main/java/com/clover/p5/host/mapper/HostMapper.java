package com.clover.p5.host.mapper;

import java.util.List;

import com.clover.p5.host.model.SearchHostDTO;
import com.clover.p5.entity.Host;

public interface HostMapper {

	String selectHost();
	
	List<Host> selectHostList(SearchHostDTO dto);
	
}
