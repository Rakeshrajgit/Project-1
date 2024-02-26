package com.main.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "customer")
@Data
@ToString
public class Customer extends BaseEntity{

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Long id;
	private String customerId;
	private String email;
	private String fullName;
	private Long phoneNo;
	private String gender;
	private String address;
	private String location;
	private String userId;
	private LocalDate dob;
	private String remarks;

	private String customerStatusCode;

	private String reportInterested;
	private String reportTaken;
	private LocalDate reportDate;
	private String fullPaymentInterested;
	private String paidFullPayment;
	private LocalDate fullPaymentDate;
	private String lookingForLoan;
	private String typeOfLoan;
	private LocalDate registerDate;
	private String idProof1;
	private String idProof2;
	private Integer openCibilScore;
	private LocalDate openDate;
	private Integer closeCibilScore;
	private LocalDate closeDate;

	private int isActive;

	private LocalDate leadGeneratedDate;
	private String CustAcqType;
}
