package com.main.repository;

import com.main.model.CustomerPayments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CustomerPaymentsRepo extends JpaRepository<CustomerPayments,Long> {

    @Query("SELECT COUNT(*) FROM CustomerPayments WHERE transactionId LIKE :transactionId")
    long findCountOfCustomerPaymentsLike(@Param("transactionId") String transactionId);
}
