package com.clover.p5.entity;

import java.sql.Date;

public class Member {
	
	private int id;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private Date birthDate;
	private String phoneNumber;
	private Date registrationDate;
	private String profilePhotoPath;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getProfilePhotoPath() {
		return profilePhotoPath;
	}
	public void setProfilePhotoPath(String profilePhotoPath) {
		this.profilePhotoPath = profilePhotoPath;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", email=" + email + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", birthDate=" + birthDate + ", phoneNumber=" + phoneNumber
				+ ", registrationDate=" + registrationDate + ", profilePhotoPath=" + profilePhotoPath + "]";
	}
	
	


	
}