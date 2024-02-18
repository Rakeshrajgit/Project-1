package com.main.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "lead_form")
public class LeadForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String leadName;
    private String leadEmail;
    private Long leadPhoneNo;
    private String leadLocation;
    private LocalDateTime registeredDate;
    private Integer convertedToCustomer=0;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    protected String createdDate;

}
