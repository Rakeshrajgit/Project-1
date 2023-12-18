package com.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.model.Customer;

public interface CustomerRepo extends JpaRepository<Customer,Integer> {
	
	

}
