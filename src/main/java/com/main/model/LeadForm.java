package com.main.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "lead")
public class LeadForm extends BaseEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String leadId;
    private String userId; //user id of agent
    private String leadAcqCode;
    private String leadName;
    private String leadEmail;
    private long leadPhoneNo;
    private String leadLocation;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime registeredDate;
    private Boolean convertedToCustomer;
    private String leadStatus;
    private String bound;
    private int callsCount;
    private String customerId;
    private int leadPoints;
    private String remarks;
    private int isActive;
    
  
    
  

    
    
}
