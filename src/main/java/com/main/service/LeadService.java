package com.main.service;

import com.main.CrmException;
import com.main.model.*;
import com.main.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
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

	@Autowired
	private LeadsStateTransactionsRepo leadsStateTransactionsRepo;

	@Autowired
	private LeadViewPunchingRepo leadViewPunchingRepo;

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


	public List<LeadForm> getLeadsOpen(String userId, LocalDate startDate, LocalDate endDate, String leadStatusCode, int leadScore) {
		return leadRepo.findByLeadFormOpen(userId,startDate,endDate,leadStatusCode, leadScore);
	}

	public List<LeadForm> getLeadSearch(String searchQuery) {
		return leadRepo.leadSearch(searchQuery);
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

	public LeadForm getLeadByLeadId(String leadId) {
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
		leadOrg.setReferedBy(lead.getReferedBy());
		leadRepo.save(leadOrg);

		return leadOrg.getId();
	}

	public long updateLeadStatusCode(LeadsStateTransactions transaction)throws CrmException {

		LeadStates state_new = leadStatesRepo.findByLeadStatusCode(transaction.getLeadStatusCodeTo());
		LeadForm lead = leadRepo.findByLeadId(transaction.getLeadId());

		if(state_new.getIsCallStatus()==1){
			lead.setCallsCount(lead.getCallsCount()+1);
			lead.setLeadPoints(lead.getLeadPoints()+5);
		}
		if(state_new.getIsCallStatus()==-1){
			lead.setCallsCount(lead.getCallsCount()+1);
			lead.setLeadPoints(lead.getLeadPoints()>=2 ? (lead.getLeadPoints()-2) : 0);
		}
		transaction.setLeadStatusCodeFrom(lead.getLeadStatus());
		lead.setLeadStatus(state_new.getLeadStatusCode());

		leadsStateTransactionsRepo.save(transaction);
		leadRepo.save(lead);
		return transaction.getId();
	}

	public List<LeadsStateTransactions> getLeadTransactions(String leadId) {
		return leadsStateTransactionsRepo.findByLeadIdOrderByTransactTimeStampAsc(leadId);
	}

	public void punchLeadViewerInfo(String userId,String leadId){

		LeadViewPunching punch = new LeadViewPunching();
		punch.setLeadId(leadId);
		punch.setUserId(userId);
        punch.setViewedDate(LocalDate.now());
        punch.setViewedTime(LocalTime.now());
		leadViewPunchingRepo.save(punch);
	}


    public long leadDelete(String leadId) {
		LeadForm lead = leadRepo.findByLeadId(leadId);
		lead.setIsActive(0);
		leadRepo.save(lead);
		return lead.getId();
    }
}
