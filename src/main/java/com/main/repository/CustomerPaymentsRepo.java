package com.main.repository;

import com.main.model.CustomerPayments;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerPaymentsRepo extends JpaRepository<CustomerPayments,Long> {
}
