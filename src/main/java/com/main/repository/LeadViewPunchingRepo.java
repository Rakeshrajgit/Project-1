package com.main.repository;

import com.main.model.LeadViewPunching;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LeadViewPunchingRepo extends JpaRepository<LeadViewPunching,Long> {

    List<LeadViewPunching> findByUserId(String userId);
    List<LeadViewPunching> findByCustomerId(String customerId);
}
