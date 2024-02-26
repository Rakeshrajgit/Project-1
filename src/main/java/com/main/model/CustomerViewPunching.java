package com.main.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "customer_view_punching")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerViewPunching {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userId;
    private String customerId;
    @Column(columnDefinition = "DATE")
    private LocalDate viewedDate;
    @Column(columnDefinition = "TIME")
    private LocalTime viewedTime;
}
