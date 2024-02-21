package com.main.model.accesscontrol;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "form_module")
@Data
public class FormModule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long FormModuleId;
    private String FormModuleName;
    private String ModuleUrl;
    private Integer SerialNo;
    private Integer IsActive;
}
