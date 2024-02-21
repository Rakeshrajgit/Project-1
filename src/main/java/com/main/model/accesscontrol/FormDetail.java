package com.main.model.accesscontrol;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "form_detail")
@Data
public class FormDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long FormDetailId;
    private Long FormModuleId;
    private String FormName;
    private String FormUrl;
    private String FormDispName;
    private Integer FormSerialNo;
    private Integer IsActive;
}
