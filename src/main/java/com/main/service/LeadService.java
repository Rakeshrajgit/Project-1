package com.main.service;

import com.main.model.LeadAcqTypes;
import com.main.model.LeadForm;
import com.main.repository.LeadAcqTypesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.repository.LeadRepo;

import java.util.List;

@Service
public class LeadService {
	
	@Autowired
	private LeadRepo leadRepo;

	@Autowired
	private LeadAcqTypesRepo leadAcqTypesRepo;

	public LeadForm saveLead(LeadForm leadForm){
		return leadRepo.save(leadForm);
	}

	public List<LeadAcqTypes> getLeadSource(){
		return leadAcqTypesRepo.findAll();
	}
	
}
