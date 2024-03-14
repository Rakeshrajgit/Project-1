package com.main.repository;

import com.main.model.CustomerInfoUpdates;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerInfoUpdatesRepo extends JpaRepository<CustomerInfoUpdates,Long> {

    List<CustomerInfoUpdates> findByCustomerIdOrderByUpdatedDateAsc(String customerId);
}
