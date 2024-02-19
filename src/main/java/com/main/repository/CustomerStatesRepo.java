package com.main.repository;

import com.main.model.CustomerStates;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerStatesRepo extends JpaRepository<CustomerStates,Long> {
}
