package com.main.repository;

import com.main.model.CustomerScoreHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerScoreHistoryRepo extends JpaRepository<CustomerScoreHistory,Long> {

    List<CustomerScoreHistory> findByCustomerIdOrderByAddedDateAsc(String customerId);
}
