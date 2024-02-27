package com.main.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "leads_state_transactions")
public class LeadsStateTransactions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String leadId;
    private String actionBy;
    private String leadStatusCodeFrom;
    private String leadStatusCodeTo;
    @CreationTimestamp
    private LocalDateTime transactTimeStamp;
    private String remarks;
}
