package com.main.model;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "crm_user")
@Data
public class CrmUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userId;
    private String userName;
    private String userEmail;
    private String password;
    private Integer isActive;
    private String createdBy;
    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    private String createdDate;
    private String updatedBy;
    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    private String updatedDate;

    private String role;


}
