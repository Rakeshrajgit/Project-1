package com.main.repository;

import com.main.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
    Customer findById(Long Id);

    Customer findByAppNo(Long appNo);
}
