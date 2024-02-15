package com.main.service;

import com.main.model.Customer;
import com.main.model.LeadViewPunching;
import com.main.repository.CustomerRepo;
import com.main.repository.LeadViewPunchingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private LeadViewPunchingRepo leadViewPunchingRepo;

    public List<Customer> getAllCustomer(){
        return customerRepo.findAll();
    }

    public Customer getCustomerByAppNo(Long AppNo){
        return customerRepo.findByAppNo(AppNo);
    }

    public List<Customer> getCustomersByAgentId(String agentId){
        return customerRepo.findByAgentId(agentId);
    }
    public List<Customer> getCustomersIfAgentIdIsNull(){
        return customerRepo.findByAgentIdIsNull();
    }


    public void punchLeadViewerInfo(String userId,Long appNo){

        LeadViewPunching punch = new LeadViewPunching();
        punch.setLeadAppNo(appNo);
        punch.setUserId(userId);
        punch.setViewedDate(LocalDate.now());
        punch.setViewedTime(LocalTime.now());
        leadViewPunchingRepo.save(punch);

    }
}
