package com.main.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "customer_score_history")
@EntityListeners(AuditingEntityListener.class)
public class CustomerScoreHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String customerId;
    private int score;
    private LocalDate scoreDate;
    @CreatedBy
    private String userId;
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    protected LocalDateTime addedDate;
}
