package com.clover.p5.place.mapper;

import java.util.List;

import com.clover.p5.DTO.SearchPlaceDTO;
import com.clover.p5.entity.Place;

public interface PlaceMapper {

	String selectPlace();
	
	List<Place> selectPlaceList(SearchPlaceDTO dto);
	
}
