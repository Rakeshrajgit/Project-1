package com.main.repository;

import com.main.model.CustomerStateTransactions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerStateTransactionsRepo extends JpaRepository<CustomerStateTransactions,Long> {
}
