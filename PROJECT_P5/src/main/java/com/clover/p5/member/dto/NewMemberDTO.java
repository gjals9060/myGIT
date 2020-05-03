package com.clover.p5.member.dto;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;


public class NewMemberDTO {
	
	
	@NotEmpty(message="이메일 입력해라")
	private String email;
	@NotEmpty(message="비밀번호 입력해라")
	private String password;
	
	
	private String passwordCheck;
	@NotEmpty(message="이름 입력해라")
	private String firstName;
	
	@NotEmpty(message="성 입력해라")
	private String lastName;
	
//	@NotEmpty(message="생년월일 입력해라")
	private Date birthDate;
	private String mobilePhone;
	private String registrationDate;
	
	
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
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
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
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	@Override
	public String toString() {
		return "NewMemberDTO [email=" + email + ", password=" + password + ", passwordCheck=" + passwordCheck
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", birthDate=" + birthDate + ", mobilePhone="
				+ mobilePhone + ", registrationDate=" + registrationDate + "]";
	}

}
