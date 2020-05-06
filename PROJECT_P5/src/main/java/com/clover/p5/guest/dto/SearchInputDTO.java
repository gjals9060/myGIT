package com.clover.p5.guest.dto;

public class SearchInputDTO {
	
	private String swLatlng;
	private String neLatlng;
	private String capacity;
	private String startDate;
	private String endDate;

	public SearchInputDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public SearchInputDTO(String swLatlng, String neLatlng, String capacity, String startDate, String endDate) {
		super();
		this.swLatlng = swLatlng;
		this.neLatlng = neLatlng;
		this.capacity = capacity;
		this.startDate = startDate;
		this.endDate = endDate;
	}



	public String getSwLatlng() {
		return swLatlng;
	}

	public void setSwLatLng(String swLatlng) {
		this.swLatlng = swLatlng;
	}

	public String getNeLatlng() {
		return neLatlng;
	}

	public void setNeLatlng(String neLatlng) {
		this.neLatlng = neLatlng;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

}
