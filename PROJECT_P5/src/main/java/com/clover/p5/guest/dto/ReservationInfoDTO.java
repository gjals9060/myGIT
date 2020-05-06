package com.clover.p5.guest.dto;

import java.util.Date;

public class ReservationInfoDTO {
	
/*	
	ID	NUMBER
	HOST_ID	NUMBER
	MEMBER_ID	NUMBER
	CHECK_IN_DATE	DATE
	CHECK_OUT_DATE	DATE
	GUEST_COUNT	NUMBER
	PAYMENT	NUMBER
	BOOKING_DATE	DATE
	CANCELLATION_DATE	DATE
	REFUND	NUMBER
*/
	private int id;
	private int hostId;
	private int memberId;
	private Date checkInDate;
	private Date checkOutDate;
	private int guestCount;
	private int payment;
	private Date bookingDate;
	private Date cancellation;
	private int refund;
	
	public ReservationInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationInfoDTO(int id, int hostId, int memberId, Date checkInDate, Date checkOutDate, int guestCount,
			int payment, Date bookingDate, Date cancellation, int refund) {
		super();
		this.id = id;
		this.hostId = hostId;
		this.memberId = memberId;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.guestCount = guestCount;
		this.payment = payment;
		this.bookingDate = bookingDate;
		this.cancellation = cancellation;
		this.refund = refund;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public int getGuestCount() {
		return guestCount;
	}

	public void setGuestCount(int guestCount) {
		this.guestCount = guestCount;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getCancellation() {
		return cancellation;
	}

	public void setCancellation(Date cancellation) {
		this.cancellation = cancellation;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}
	
	
	
}
