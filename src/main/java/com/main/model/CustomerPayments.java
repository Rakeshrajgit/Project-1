package com.main.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "customer_payments")
public class CustomerPayments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String transactionId;
    private String userId;
    private int paymentAmount;
    private LocalDateTime transactionDate;
}
