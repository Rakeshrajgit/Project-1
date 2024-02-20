package com.main.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "lead_states")
public class LeadStates {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String leadStatusCode;
    private String leadStatus;
    private int isCallStatus;
}
