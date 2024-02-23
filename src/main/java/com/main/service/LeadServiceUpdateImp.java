package com.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.LeadForm;
import com.main.repository.LeadRepo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class LeadServiceUpdateImp implements LeadServiceUpdate {
	
	@Autowired
	LeadRepo leadrepo;
	
	

	    @Override
	    public LeadForm getLeadById(Long id) {
	        // Implement logic to retrieve lead by ID from repository
	        return leadrepo.findById(id).orElse(null);
	    }

	    @Override
	    public void updateLead(Long id, LeadForm updatedLead,HttpServletRequest req) {
	        // Implement logic to update lead by ID in the repository
	        LeadForm existingLead = leadrepo.findById(id).orElse(null);
	        if (existingLead != null) {
	            existingLead.setLeadName(req.getParameter("name"));
	            existingLead.setLeadEmail(req.getParameter("email"));
	            existingLead.setLeadPhoneNo(Long.parseLong(req.getParameter("phoneNo")));
	            existingLead.setLeadLocation(req.getParameter("location"));
	            //existingLead.setLeadAcqCode(updatedLead.getLeadAcqCode());

	            leadrepo.save(existingLead);
	        }
	    }

	}


