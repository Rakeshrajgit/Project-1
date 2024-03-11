package com.main.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.LastModifiedBy;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "customer_info_updates")
@Data
@ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class CustomerInfoUpdates{

	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	@JsonIgnore
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
	protected String updatedBy;
	protected LocalDateTime updatedDate;
}
