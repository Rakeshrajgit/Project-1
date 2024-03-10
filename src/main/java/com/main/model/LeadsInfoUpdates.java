package com.main.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "leads_info_updates")
@EntityListeners(AuditingEntityListener.class)
public class LeadsInfoUpdates {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String leadId;
    private String userId; //user id of agent
    private String leadAcqCode;
    private String leadName;
    private String leadEmail;
    private Long leadPhoneNo;
    private String leadLocation;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime registeredDate;
    private int convertedToCustomer;
    private String leadStatus;
    private String bound;
    private int callsCount;
    private String customerId;
    private int leadPoints;
    private String remarks;
    private String referedBy;
    private int isActive;

    @CreatedBy
    protected String createdBy;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    protected LocalDateTime createdDate;
}
