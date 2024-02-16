package com.main.repository;

import com.main.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
    Customer findByAppNo(Long appNo);
    List<Customer> findByAgentId(String agentId);
    List<Customer> findByAgentIdIsNull();


}
