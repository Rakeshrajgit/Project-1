package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Customer {

	
	@Id
	@GeneratedValue(strategy =GenerationType.SEQUENCE )
	int appNo;
	String email;
	String fullName;
	String phoneNo;
	
	
	public Customer()
	{
		
	}
	
	
	public Customer(int appNo, String email, String fullName, String phoneNo) {
		super();
		this.appNo = appNo;
		this.email = email;
		this.fullName = fullName;
		this.phoneNo = phoneNo;
	}


	public Customer( String email, String fullName, String phoneNo) {
		super();
		
		this.email = email;
		this.fullName = fullName;
		this.phoneNo = phoneNo;
	}

	public int getAppNo() {
		return appNo;
	}


	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}




	@Override
	public String toString() {
		return "Customer [appNo=" + appNo + ", email=" + email + ", fullName=" + fullName + ", phoneNo=" + phoneNo
				+ "]";
	}
	
	
	
	
	
}
