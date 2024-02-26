package com.main.repository;

import com.main.model.LeadsStateTransactions;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LeadsStateTransactionsRepo extends JpaRepository<LeadsStateTransactions,Long> {

    List<LeadsStateTransactions> findByLeadIdOrderByTransactTimeStampAsc(String leadId);
}
