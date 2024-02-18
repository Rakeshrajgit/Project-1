package com.main.repository;

import com.main.model.CustomerStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerStatusRepo extends JpaRepository<CustomerStatus,Long> {
}
