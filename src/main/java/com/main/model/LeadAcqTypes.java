package com.main.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "lead_acquisition_types")
public class LeadAcqTypes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String leadAcqCode;
    private String leadAcqType;

}
