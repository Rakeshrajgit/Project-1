package com.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.CrmUser;

import com.main.repository.AdminRepo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class UserServiceUpdateImpl implements UserServiceUpdate {
	
	@Autowired
	AdminRepo adminrepo;
	
	
	
	 @Override
	    public CrmUser getUserById(Long id) {
	        // Implement logic to retrieve lead by ID from repository
	        return adminrepo.findById(id).orElse(null);
	    }

	    @Override
	    public void updateUser(Long id, CrmUser updatedLead,HttpServletRequest req) {
	        // Implement logic to update lead by ID in the repository
	        CrmUser existingLead = adminrepo.findById(id).orElse(null);
	        if (existingLead != null) {
	            existingLead.setUserName(req.getParameter("name"));
	            existingLead.setUserEmail(req.getParameter("email"));
	            existingLead.setPassword(req.getParameter("password"));
	         

	            adminrepo.save(existingLead);
	        }
	    }
	

}
