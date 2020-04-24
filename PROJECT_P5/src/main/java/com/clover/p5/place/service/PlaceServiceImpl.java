package com.clover.p5.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.p5.DTO.SearchPlaceDTO;
import com.clover.p5.entity.Place;
import com.clover.p5.place.mapper.PlaceMapper;

@Service
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	private PlaceMapper placeMapper;
	
	
	@Override
	public String selectPlace() {
		
		String str = placeMapper.selectPlace();
		
		return str;
		
	}


	@Override
	public List<Place> selectPlaceList(SearchPlaceDTO dto) {
		
		
		List<Place> list = placeMapper.selectPlaceList(dto);
		
		
		return list;
	}

}
