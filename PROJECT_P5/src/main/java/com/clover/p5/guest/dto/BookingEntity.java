package com.clover.p5.guest.dto;

import java.util.Date;

public class BookingEntity {
	
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
	private String checkInDate;
	private String checkOutDate;
	private int guestCount;
	private int payment;
	private String bookingDate;
	private String cancellation;
	private int refund;
	
	public BookingEntity() {
		// TODO Auto-generated constructor stub
	}

	public BookingEntity(int id, int hostId, int memberId, String checkInDate, String checkOutDate, int guestCount,
			int payment, String bookingDate, String cancellation, int refund) {
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

	
	@Override
	public String toString() {
		return "ReservationInfoDTO [id=" + id + ", hostId=" + hostId + ", memberId=" + memberId + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", guestCount=" + guestCount + ", payment=" + payment
				+ ", bookingDate=" + bookingDate + ", cancellation=" + cancellation + ", refund=" + refund + "]";
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

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
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

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getCancellation() {
		return cancellation;
	}

	public void setCancellation(String cancellation) {
		this.cancellation = cancellation;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}

	
}
