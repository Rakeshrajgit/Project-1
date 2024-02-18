package com.main.model;


import java.time.LocalDateTime;

public class CustomerStateTransactions {

    private Long id;
    private String customerId;
    private String actionBy;
    private String customerStatusCodeFrom;
    private String customerStatusCodeTo;
    private LocalDateTime transactTimeStamp;
    private String remarks;
}
