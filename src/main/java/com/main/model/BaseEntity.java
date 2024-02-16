package com.main.model;

import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Data
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {
    @CreatedBy
    protected String createdBy;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    protected String createdDate;
    @LastModifiedBy
    protected String updatedBy;
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    protected String updatedDate;
}
