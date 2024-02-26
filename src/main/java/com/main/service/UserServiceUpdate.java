package com.main.service;

import com.main.model.CrmUser;
import com.main.model.LeadForm;

import jakarta.servlet.http.HttpServletRequest;

public interface UserServiceUpdate {
	
 CrmUser getUserById(Long id);
	 
	 
	 void updateUser(Long id, CrmUser updatedUser,HttpServletRequest req);

}
