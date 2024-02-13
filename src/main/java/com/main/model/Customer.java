package com.main.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Customer {

	@Id
	@GeneratedValue(strategy =GenerationType.SEQUENCE)
	private Long id;
	private Integer appNo;
	private String email;
	private String fullName;
	private String phoneNo;
	
	
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

	@Override
	public String toString() {
		return "Customer [appNo=" + appNo + ", email=" + email + ", fullName=" + fullName + ", phoneNo=" + phoneNo
				+ "]";
	}
	
	
	
	
	
}
