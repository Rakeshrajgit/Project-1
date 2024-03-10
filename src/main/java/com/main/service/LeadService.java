package com.main.service;

import com.main.CrmException;
import com.main.model.*;
import com.main.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

	public List<LeadForm> getLeadsByRegisteredBetween(LocalDateTime fromDate, LocalDateTime toDate, int isActive){
		return leadRepo.findByRegisteredDateBetweenAndIsActiveOrderByRegisteredDateAsc(fromDate,toDate,isActive);
	}

	public Map<String, Long> getLeadDBSourceCount(List<LeadForm> leads, List<LeadAcqTypes> leadSourceTypes  ){

		Map<String, Long> sourceCountMapTemp = new LinkedHashMap<>();
		for(LeadForm lead : leads){
			if(sourceCountMapTemp.get(lead.getLeadAcqCode()) == null){
				sourceCountMapTemp.put(lead.getLeadAcqCode(),1L);
			}else {
				sourceCountMapTemp.put(lead.getLeadAcqCode(),sourceCountMapTemp.get(lead.getLeadAcqCode())+1);
			}
		}

		Map<String, Long> sourceCountMap = new LinkedHashMap<>();

		for(LeadAcqTypes src : leadSourceTypes){

			if(sourceCountMapTemp.get(src.getLeadAcqCode())==null){
				sourceCountMap.put(src.getLeadAcqType(),0L);
			}else{
				sourceCountMap.put(src.getLeadAcqType(),sourceCountMapTemp.get(src.getLeadAcqCode()));
			}

		}

		return sourceCountMap;
	}

	public Map<LocalDate, Long> getLeadDBDateCount(List<LeadForm> leads, LocalDate fromDate,LocalDate toDate ){

		Map<LocalDate, Long> leadDateCount =  new LinkedHashMap<>();
		while(fromDate.isBefore(toDate) || fromDate.isEqual(toDate) ){
			leadDateCount.put(fromDate,0L);
			fromDate = fromDate.plusDays(1);
		}


		for(LeadForm lead : leads){

			LocalDate regDate = lead.getRegisteredDate().toLocalDate();
			leadDateCount.put(regDate,leadDateCount.get(regDate)+1);

		}
		return leadDateCount;
	}


}
