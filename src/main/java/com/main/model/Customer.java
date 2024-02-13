package com.main.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Customer")
@Data
public class Customer {

	@Id
	@GeneratedValue(strategy =GenerationType.SEQUENCE)
	private Long id;
	private Long appNo;
	private String email;
	private String fullName;
	private String phoneNo;

	public Customer(){}
	public Customer(String email, String fullName, String phoneNo) {
		this.email=email;
		this.fullName=fullName;
		this.phoneNo=phoneNo;
	}
}
