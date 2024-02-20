package com.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.repository.LeadRepo;

@Service
public class LeadService {
	
	@Autowired
	LeadRepo lr;

	
	
}
