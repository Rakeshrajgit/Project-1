package com.main.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "leads_info_updates")
@JsonIgnoreProperties(ignoreUnknown = true)
public class LeadsInfoUpdates {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private Long id;
    private String leadId;
    private String userId;
    private String leadAcqCode;
    private String leadName;
    private String leadEmail;
    private Long leadPhoneNo;
    private String leadLocation;
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
    protected String updatedBy;
    protected LocalDateTime updatedDate;
}
