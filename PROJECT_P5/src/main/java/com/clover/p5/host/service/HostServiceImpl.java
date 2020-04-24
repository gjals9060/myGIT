package com.clover.p5.host.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.p5.DTO.SearchHostDTO;
import com.clover.p5.entity.Host;
import com.clover.p5.host.mapper.HostMapper;

@Service
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostMapper hostMapper;
	
	
	@Override
	public String selectHost() {
		
		String str = hostMapper.selectHost();
		
		return str;
		
	}


	@Override
	public List<Host> selectHostList(SearchHostDTO dto) {
		
		
		List<Host> list = hostMapper.selectHostList(dto);
		
		
		return list;
	}

}
