package com.main.service;

import com.main.model.Customer;
import com.main.model.CustomerStatus;
import com.main.model.LeadViewPunching;
import com.main.repository.CustomerRepo;
import com.main.repository.CustomerStatusRepo;
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
    private CustomerStatusRepo customerStatusRepo;

    @Autowired
    private LeadViewPunchingRepo leadViewPunchingRepo;

    public List<Customer> getAllCustomer(){
        return customerRepo.findAll();
    }

    public Customer getCustomerByCustomerId(String customerId){
        return customerRepo.findByCustomerId(customerId);
    }

    public List<Customer> getCustomersByCustomerId(String customerId){
        return customerRepo.findByUserId(customerId);
    }
    public List<Customer> getCustomersIfCustomerIdIsNull(){
        return customerRepo.findByCustomerIdIsNull();
    }


    public void punchLeadViewerInfo(String userId,String customerId){

        LeadViewPunching punch = new LeadViewPunching();
        punch.setCustomerId(customerId);
        punch.setUserId(userId);
        punch.setViewedDate(LocalDate.now());
        punch.setViewedTime(LocalTime.now());
        leadViewPunchingRepo.save(punch);
    }

    public Long updateAgentForCustomer(String appNo, String agentId){
        Customer customer = customerRepo.findByCustomerId(appNo);
        customer.setUserId(agentId.equalsIgnoreCase("")?null:agentId);
        customerRepo.save(customer);
        return customer.getId();
    }

    public List<CustomerStatus> getAllCustomerStatus(){
        return customerStatusRepo.findAll();
    }
}
