package com.clover.p5.entity;

import java.sql.Date;

public class Host {
	
	private int id;
	private int MemberId;
	private String name;
	private String description;
	private String descriptionEtc;
	
	private char type;
	private char roomType;
	private int capacity;
	private int roomCount;
	private int bedCount;
	private int bathroomCount;
	
	private String address;
	private double latitude;
	private double longitude;
	
	private char isTv;
	private char isWifi;
	private char isAirConditioner;
	private char isAirPurifier;
	private char isHairDryer;
	private char isIron;
	
	private char isKitchen;
	private char isWashingMachine;
	private char isElevator;
	private char isParkingLot;
	
	private int minimumStay;
	private int maximumStay;
	private int price;
	
	private Date creationDate;
	private Date modificationDate;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemberId() {
		return MemberId;
	}
	public void setMemberId(int memberId) {
		MemberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescriptionEtc() {
		return descriptionEtc;
	}
	public void setDescriptionEtc(String descriptionEtc) {
		this.descriptionEtc = descriptionEtc;
	}
	public char getType() {
		return type;
	}
	public void setType(char type) {
		this.type = type;
	}
	public char getRoomType() {
		return roomType;
	}
	public void setRoomType(char roomType) {
		this.roomType = roomType;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getRoomCount() {
		return roomCount;
	}
	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}
	public int getBedCount() {
		return bedCount;
	}
	public void setBedCount(int bedCount) {
		this.bedCount = bedCount;
	}
	public int getBathroomCount() {
		return bathroomCount;
	}
	public void setBathroomCount(int bathroomCount) {
		this.bathroomCount = bathroomCount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public char getIsTv() {
		return isTv;
	}
	public void setIsTv(char isTv) {
		this.isTv = isTv;
	}
	public char getIsWifi() {
		return isWifi;
	}
	public void setIsWifi(char isWifi) {
		this.isWifi = isWifi;
	}
	public char getIsAirConditioner() {
		return isAirConditioner;
	}
	public void setIsAirConditioner(char isAirConditioner) {
		this.isAirConditioner = isAirConditioner;
	}
	public char getIsAirPurifier() {
		return isAirPurifier;
	}
	public void setIsAirPurifier(char isAirPurifier) {
		this.isAirPurifier = isAirPurifier;
	}
	public char getIsHairDryer() {
		return isHairDryer;
	}
	public void setIsHairDryer(char isHairDryer) {
		this.isHairDryer = isHairDryer;
	}
	public char getIsIron() {
		return isIron;
	}
	public void setIsIron(char isIron) {
		this.isIron = isIron;
	}
	public char getIsKitchen() {
		return isKitchen;
	}
	public void setIsKitchen(char isKitchen) {
		this.isKitchen = isKitchen;
	}
	public char getIsWashingMachine() {
		return isWashingMachine;
	}
	public void setIsWashingMachine(char isWashingMachine) {
		this.isWashingMachine = isWashingMachine;
	}
	public char getIsElevator() {
		return isElevator;
	}
	public void setIsElevator(char isElevator) {
		this.isElevator = isElevator;
	}
	public char getIsParkingLot() {
		return isParkingLot;
	}
	public void setIsParkingLot(char isParkingLot) {
		this.isParkingLot = isParkingLot;
	}
	public int getMinimumStay() {
		return minimumStay;
	}
	public void setMinimumStay(int minimumStay) {
		this.minimumStay = minimumStay;
	}
	public int getMaximumStay() {
		return maximumStay;
	}
	public void setMaximumStay(int maximumStay) {
		this.maximumStay = maximumStay;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getModificationDate() {
		return modificationDate;
	}
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}
	
	@Override
	public String toString() {
		return "Host [id=" + id + ", MemberId=" + MemberId + ", name=" + name + ", description=" + description
				+ ", descriptionEtc=" + descriptionEtc + ", type=" + type + ", roomType=" + roomType + ", capacity="
				+ capacity + ", roomCount=" + roomCount + ", bedCount=" + bedCount + ", bathroomCount=" + bathroomCount
				+ ", address=" + address + ", latitude=" + latitude + ", longitude=" + longitude + ", isTv=" + isTv
				+ ", isWifi=" + isWifi + ", isAirConditioner=" + isAirConditioner + ", isAirPurifier=" + isAirPurifier
				+ ", isHairDryer=" + isHairDryer + ", isIron=" + isIron + ", isKitchen=" + isKitchen
				+ ", isWashingMachine=" + isWashingMachine + ", isElevator=" + isElevator + ", isParkingLot="
				+ isParkingLot + ", minimumStay=" + minimumStay + ", maximumStay=" + maximumStay + ", price=" + price
				+ ", creationDate=" + creationDate + ", modificationDate=" + modificationDate + "]";
	}

}
