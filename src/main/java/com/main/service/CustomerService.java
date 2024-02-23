package com.main.service;

import com.main.CrmException;
import com.main.model.*;
import com.main.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private CustomerStatesRepo customerStatesRepo;

    @Autowired
    private CustomerStateTransactionsRepo customerStateTransactionsRepo;

    @Autowired
    private CustomerPaymentsRepo customerPaymentsRepo;

    @Autowired
    private LeadViewPunchingRepo leadViewPunchingRepo;

    public List<Customer> getAllCustomer(){
        return customerRepo.findAll();
    }

    public Customer getCustomerByCustomerId(String customerId){
        return customerRepo.findByCustomerId(customerId);
    }

    public List<Customer> getCustomersByUserId(String customerId){
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

    public List<CustomerStates> getAllCustomerStatus(){
        return customerStatesRepo.findAll();
    }

    public Customer customerAddEdit(Customer customer){

        if(customer.getCustomerId()==null || customer.getCustomerId().trim().isEmpty()){
            return customerAdd(customer);
        }else {
            return customerEdit(customer);
        }

    }

    private Customer customerAdd(Customer customer){
        customer.setCustomerId(generateCustomerId());
        customer.setCustomerStatusCode("IIR");
        customer.setRegisterDate(LocalDate.now());


        CustomerStateTransactions transaction = CustomerStateTransactions.builder()
                .customerStatusCodeTo("IIR")
                .customerStatusCodeFrom("IIR")
//                .actionBy(userId)
                .customerId(customer.getCustomerId())
                .build();
        customerStateTransactionsRepo.save(transaction);

        return customerRepo.save(customer);
    }
    private Customer customerEdit(Customer customer){
        Customer customerOrg = customerRepo.findByCustomerId(customer.getCustomerId());
        customerOrg.setFullName(customer.getFullName());
        customerOrg.setEmail(customer.getEmail());
        customerOrg.setPhoneNo(customer.getPhoneNo());
        customerOrg.setGender(customer.getGender());
        customerOrg.setDob(customer.getDob());
        customerOrg.setAddress(customer.getAddress());
        customerOrg.setIdProof1(customer.getIdProof1());
        customerOrg.setIdProof2(customer.getIdProof2());
        customerOrg.setOpenCibilScore(customer.getOpenCibilScore());
        customerOrg.setOpenDate(customer.getOpenDate());
        customerOrg.setCloseCibilScore(customer.getCloseCibilScore());
        customerOrg.setCloseDate(customer.getCloseDate());

        return customerRepo.save(customerOrg);
    }

    private String generateCustomerId(){
        long count = customerRepo.findCountOfCustomer();
        return "CUS-"+(count+1);
    }


    @Transactional
    public long updateCustomerStatusCode( CustomerStateTransactions transaction, String full_payment_amount) throws Exception {
        CustomerStates state_new =  customerStatesRepo.findByCustomerStatusCode(transaction.getCustomerStatusCodeTo());
        int payment_amount = 0;
        if(state_new.getIsPaymentType()==1 && state_new.getExplicitPaymentType()==0) {
            List<CustomerStateTransactions> custTransactions = customerStateTransactionsRepo.findByCustomerId(transaction.getCustomerId());
            for (CustomerStateTransactions custTransaction : custTransactions) {
                if (custTransaction.getCustomerStatusCodeTo().equalsIgnoreCase(state_new.getCustomerStatusCode())) {
                    throw new CrmException("Transaction Already Exists for this Customer");
                }
            }
            payment_amount = state_new.getPaymentAmount();
        }

        if(state_new.getIsPaymentType()==1 && state_new.getExplicitPaymentType()==1) {
            List<CustomerStateTransactions> custTransactions = customerStateTransactionsRepo.findByCustomerId(transaction.getCustomerId());
            for (CustomerStateTransactions custTransaction : custTransactions) {
                if (custTransaction.getCustomerStatusCodeTo().equalsIgnoreCase(state_new.getCustomerStatusCode())) {
                    throw new CrmException("Transaction Already Exists for this Customer");
                }
            }
            if(full_payment_amount==null || Integer.parseInt(full_payment_amount)<=0){
                throw new CrmException("Invalid payment amount added");
            }
            payment_amount = Integer.parseInt(full_payment_amount);
        }

        Customer customer = customerRepo.findByCustomerId(transaction.getCustomerId());
//        CustomerStates state_old =  customerStatesRepo.findByCustomerStatusCode(customer.getCustomerStatusCode());
        transaction.setCustomerStatusCodeFrom(customer.getCustomerStatusCode());
        customerStateTransactionsRepo.save(transaction);

        if(state_new.getIsPaymentType()==1){
            CustomerPayments customerPayments = CustomerPayments.builder()
                    .customerId(transaction.getCustomerId())
                    .customerStatusCode(state_new.getCustomerStatusCode())
                    .transactionId(generateCustomerTransactionId())
                    .transactionDate(LocalDateTime.now())
                    .paymentAmount(payment_amount)
                    .userId(transaction.getActionBy())
                    .build();

            customerPaymentsRepo.save(customerPayments);
        }


        customer.setCustomerStatusCode(transaction.getCustomerStatusCodeTo());
        customer.setRemarks(transaction.getRemarks());
        customerRepo.save(customer);

        return transaction.getId();
    }

    private String generateCustomerTransactionId(){
        String regex = "PYMT-"+LocalDate.now().getMonth().getValue()+"-"+LocalDate.now().getYear()+"-";
        long count = customerPaymentsRepo.findCountOfCustomerPaymentsLike(regex);
        return regex+(count+1);
    }
}
