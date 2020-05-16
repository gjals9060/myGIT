package com.clover.p5.guest.mapper;

import java.util.Date;
import java.util.List;

import com.clover.p5.guest.dto.HostInfoDTO;
import com.clover.p5.guest.dto.HostPhotoDTO;
import com.clover.p5.guest.dto.BookingEntity;
import com.clover.p5.guest.dto.SearchHostDTO;
import com.clover.p5.host.dto.BlockingDTO;

public interface GuestMapper {


	HostInfoDTO selectHost(String id);
	
	List<HostInfoDTO> selectHostList(SearchHostDTO searchHostDto);	// 검색할 때 인원은 guestCount => 출력시에는 호스트의 수용인원값(capacity)

	List<HostPhotoDTO> selectHostPhoto(String hostId);
	
	List<Date> selectBlocking(String hostId);
	
	int insertBooking(BookingEntity booking);	//성공시 1
	
	int insertBlocking(int hostId, String[] arrBlockingDate);
	
	List<BookingEntity> selectBooking(String memberId);
}
