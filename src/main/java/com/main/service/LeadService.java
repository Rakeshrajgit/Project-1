package com.main.service;

import com.main.model.*;
import com.main.repository.CrmUserRepository;
import com.main.repository.LeadAcqTypesRepo;
import com.main.repository.LeadStatesRepo;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.repository.LeadRepo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class LeadService {
	
	@Autowired
	private LeadRepo leadRepo;

	@Autowired
	private CrmUserRepository crmUserRepository;

	@Autowired
	private LeadStatesRepo leadStatesRepo;

	@Autowired
	private LeadAcqTypesRepo leadAcqTypesRepo;

	public LeadForm saveLead(LeadForm lead){

		lead.setLeadId(generateLeadId());
		lead.setLeadStatus("LRE");
		lead.setConvertedToCustomer(0);
		lead.setLeadPoints(10);
		lead.setCallsCount(0);
		lead.setIsActive(1);

		return leadRepo.save(lead);
	}
	private String generateLeadId(){
		String regex = "LEA-"+LocalDate.now().toString().replace("-","")+"-";
		long count = leadRepo.findCountOfLeadIdLike(regex+"%");
		return regex+(count+1);
	}


	public List<LeadAcqTypes> getLeadSource(){
		return leadAcqTypesRepo.findAll();
	}

	public List<CrmUser> getUsersByRole(String role){
		return crmUserRepository.findByRole(role);
	}

	public CrmUser getUsersByUserId(String userId){
		return crmUserRepository.findByUserId(userId);
	}


	public List<LeadForm> getLeadsOpen(String userId, LocalDate startDate, LocalDate endDate, String leadStatusCode) {
		return leadRepo.findByLeadFormOpen(userId,startDate,endDate,leadStatusCode);
	}


	public List<LeadStates> getAllLeadStatus() {
		return leadStatesRepo.findAll();
	}

	public Long updateAgentForLead(String leadId, String agentId){
		LeadForm lead = leadRepo.findByLeadId(leadId);
		lead.setUserId(agentId.equalsIgnoreCase("")?null : agentId);
		leadRepo.save(lead);
		return lead.getId();
	}

	public LeadForm getLeadById(String leadId) {
		return leadRepo.findByLeadId(leadId);
	}

	public long updateLead(LeadForm lead) {
		LeadForm leadOrg = leadRepo.findByLeadId(lead.getLeadId());
		leadOrg.setLeadName(lead.getLeadName());
		leadOrg.setLeadEmail(lead.getLeadEmail());
		leadOrg.setLeadPhoneNo(lead.getLeadPhoneNo());
		leadOrg.setLeadLocation(lead.getLeadLocation());
		leadOrg.setLeadAcqCode(lead.getLeadAcqCode());
		leadOrg.setBound(lead.getBound());
		leadRepo.save(leadOrg);

		return leadOrg.getId();
	}
}
