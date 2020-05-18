package com.clover.p5.guest.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clover.p5.guest.dto.HostInfoDTO;
import com.clover.p5.guest.dto.HostPhotoDTO;
import com.clover.p5.guest.dto.BookingEntity;
import com.clover.p5.guest.dto.SearchHostDTO;
import com.clover.p5.host.dto.BlockingDTO;

public interface GuestMapper {


	HostInfoDTO selectHost(String id);
	
	List<HostInfoDTO> selectHostList(SearchHostDTO searchHostDto);	// 검색할 때 인원은 guestCount => 출력시에는 호스트의 수용인원값(capacity)

	List<HostPhotoDTO> selectHostPhotoList(String hostId);
	
	HostPhotoDTO selectRepresentativePhoto(String hostId);
	
	List<Date> selectBlocking(String hostId);
	
	int insertBooking(BookingEntity booking);	//성공시 1
	
	int updateBooking(
			@Param("bookingId") int id,
			@Param("cancellationDate") String cancellationDate,
			@Param("refund") int refund
			);
	
	int insertBlocking(
			@Param("hostId") int hostId, 
			@Param("arrBlockingDate") String[] arrBlockingDate
			);
	
	List<BookingEntity> selectBooking(String memberId);
	
}
