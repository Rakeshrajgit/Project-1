package com.main.model;


import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;

import java.time.LocalDateTime;

@Entity
@Table(name = "customer_state_transactions")
@Data
public class CustomerStateTransactions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String customerId;
    private String customerStatusCodeFrom;
    private String customerStatusCodeTo;
    private String remarks;
    @CreatedBy
    private String actionBy;
    @CreationTimestamp
    private LocalDateTime transactTimeStamp;

}
