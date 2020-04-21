package com.clover.p5.entity;

import java.sql.Date;

public class Place {
	
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
	private float latitude;
	private float longitude;
	
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
	
	
	
	
	
}
