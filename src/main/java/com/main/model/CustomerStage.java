package com.main.model;

import jakarta.persistence.*;

@Entity
@Table(name = "customer_status")
public class CustomerStage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String customerStatusCode;
    private String customerStatus;
    private String isPaymentType;
    private Integer paymentAmount;
}
