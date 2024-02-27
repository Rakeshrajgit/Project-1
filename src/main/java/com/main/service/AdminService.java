package com.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.repository.AdminRepo;

@Service
public class AdminService {

	@Autowired
	private AdminRepo adminrepo;
	
	  public List<CrmUser> getAllUsers(){
	        return adminrepo.findAll();
	    }
	  
	  public List<CrmUser> getUsersIfUserIdIsNull(){
	        return adminrepo.findByUserIdIsNull();
	    }
	
	  
	  public List<CrmUser> getUsersByUserId(String userId){
	        return adminrepo.findByUserId(userId);
	    }
}
