package com.main.model.accesscontrol;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "form_role_access")
@Data
public class FormRoleAccess {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long FormRoleAccessId;
    private String LoginType;
    private Long FormDetailId;
    private Integer IsActive;
}
