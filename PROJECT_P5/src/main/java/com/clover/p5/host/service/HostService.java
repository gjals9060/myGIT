package com.clover.p5.host.service;

import java.util.List;

import com.clover.p5.DTO.SearchHostDTO;
import com.clover.p5.entity.Host;

public interface HostService {

	String selectHost();
	
	List<Host> selectHostList(SearchHostDTO dto);
	
}
