package com.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.model.LeadForm;

public interface LeadRepo extends JpaRepository<LeadForm, Long> {
	
	

}
