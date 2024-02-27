package com.main.repository;

import com.main.model.CustomerViewPunching;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerViewPunchingRepo extends JpaRepository<CustomerViewPunching,Long> {

    List<CustomerViewPunching> findByUserId(String userId);
    List<CustomerViewPunching> findByCustomerId(String customerId);

}
