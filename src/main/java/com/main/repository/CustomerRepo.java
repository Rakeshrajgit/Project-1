package com.main.repository;

import com.main.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
    Customer findByCustomerId(String customerId);
    List<Customer> findByUserId(String userId);
    List<Customer> findByCustomerIdIsNull();


}
