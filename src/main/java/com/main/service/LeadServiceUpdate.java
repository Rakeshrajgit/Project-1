package com.main.service;

import com.main.model.LeadForm;


import jakarta.servlet.http.HttpServletRequest;

public interface LeadServiceUpdate {
	
	
	 LeadForm getLeadById(Long id);
	 
	 
	 void updateLead(Long id, LeadForm updatedLead,HttpServletRequest req);
	 
	 
	 
	

}
