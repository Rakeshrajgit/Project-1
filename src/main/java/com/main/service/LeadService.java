package com.main.service;

import com.main.configs.enums.UserTypes;
import com.main.model.Customer;
import com.main.model.CustomerStates;
import com.main.model.LeadAcqTypes;
import com.main.model.LeadForm;
import com.main.model.LeadStates;
import com.main.model.LeadViewPunching;
import com.main.repository.LeadAcqTypesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.repository.LeadRepo;
import com.main.repository.LeadStatesRepo;
import com.main.repository.LeadViewPunchingRepo;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Service
public class LeadService {
	
	@Autowired
	private LeadRepo leadRepo;
	
	@Autowired
	private LeadStatesRepo leadstaterepo;

	@Autowired
	private LeadAcqTypesRepo leadAcqTypesRepo;
	
	 @Autowired
	 private LeadViewPunchingRepo leadViewPunchingRepo;
	 
	 
	 

	public LeadForm saveLead(LeadForm leadForm){
		return leadRepo.save(leadForm);
	}

	public List<LeadAcqTypes> getLeadSource(){
		return leadAcqTypesRepo.findAll();
	}

	public List<LeadForm> getAllLead() {
		return leadRepo.findAll();
	}

	public List<LeadForm> getLeadsIfLeadIdIsNull() {
		return leadRepo.findByLeadIdIsNull();
	}

	 public List<LeadForm> getLeadsByLeadId(String leadId){
	        return leadRepo.findByUserId(leadId);
	    }

	
	 public List<LeadStates> getAllLeadStatus(){
	        return leadstaterepo.findAll();
	    }
	
	 public Long updateAgentForLead(String appNo, String agentId){
	        LeadForm lead = leadRepo.findByLeadId(appNo);
	        lead.setUserId(agentId.equalsIgnoreCase("")?null:agentId);
	        leadRepo.save(lead);
	        return lead.getId();
	    }
	
	
	 public String generateLeadId(){
	        String userIdPrefix="LE";
	      
	        long leadNo= leadRepo.findCountByLeadIdLike(userIdPrefix+"%");
	        String leadId=userIdPrefix+"-"+(leadNo+001);
	        return leadId;
	    }
	 

}
