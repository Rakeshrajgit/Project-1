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
    private CustomerScoreHistoryRepo customerScoreHistoryRepo;

    @Autowired
    private LeadRepo leadRepo;

    @Autowired
    private LeadsStateTransactionsRepo leadsStateTransactionsRepo;

    @Autowired
    private CustomerViewPunchingRepo customerViewPunchingRepo;

    public List<Customer> getAllCustomer(){
        return customerRepo.findAll();
    }

    public Customer getCustomerByCustomerId(String customerId){
        return customerRepo.findByCustomerId(customerId);
    }

    public List<Customer> getCustomerOpen(String customerId,LocalDate fromDate,LocalDate toDate,String customerStatusCode){
        return customerRepo.findByCustomerOpen(customerId,fromDate,toDate,customerStatusCode);
    }

    public List<Customer> getCustomerClosed(String customerId,LocalDate fromDate,LocalDate toDate,String customerStatusCode){
        return customerRepo.findByCustomerClosed(customerId,fromDate,toDate,customerStatusCode);
    }

    public List<Customer> getCustomersIfCustomerIdIsNull(){
        return customerRepo.findByCustomerIdIsNull();
    }


    public void punchCustomerViewerInfo(String userId,String customerId){

        CustomerViewPunching punch = new CustomerViewPunching();
        punch.setCustomerId(customerId);
        punch.setUserId(userId);
        punch.setViewedDate(LocalDate.now());
        punch.setViewedTime(LocalTime.now());
        customerViewPunchingRepo.save(punch);
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

    public Customer customerAddEdit(Customer customer,String lead_id){

        if(customer.getCustomerId()==null || customer.getCustomerId().trim().isEmpty()){


            if(lead_id!=null){
                LeadForm lead = leadRepo.findByLeadId(lead_id);
                customer.setLeadGeneratedDate(lead.getRegisteredDate().toLocalDate());
                customer.setCustAcqType(lead.getLeadAcqCode());
                customer = customerAdd(customer);
                lead.setConvertedToCustomer(1);
                lead.setCustomerId(customer.getCustomerId());
                leadRepo.save(lead);

                LeadsStateTransactions leadsTransaction =  LeadsStateTransactions.builder()
                        .actionBy(customer.getCreatedBy())
                        .leadId(lead.getLeadId())
                        .leadStatusCodeTo("CTC")
                        .build();
                leadsStateTransactionsRepo.save(leadsTransaction);
            }else{
                customer = customerAdd(customer);
            }
            return customer;
        }else {
            return customerEdit(customer);
        }

    }

    private Customer customerAdd(Customer customer){
        customer.setCustomerId(generateCustomerId());
        customer.setCustomerStatusCode("IIR");
        customer.setReportInterested("yes");
        customer.setRegisterDate(LocalDate.now());


//        CustomerStateTransactions transaction = CustomerStateTransactions.builder()
//                .customerStatusCodeTo("IIR")
//                .customerStatusCodeFrom("IIR")
//                .actionBy(userId)
//                .customerId(customer.getCustomerId())
//                .build();
//        customerStateTransactionsRepo.save(transaction);

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
        String regex = "CUS-"+LocalDate.now().toString().replace("-","")+"-";
        long count = customerRepo.findCountOfCustomerIdLike(regex+"%");
        return regex+(count+1);
    }


    @Transactional
    public long updateCustomerStatusCode( CustomerStateTransactions transaction, String full_payment_amount) throws Exception {
        CustomerStates state_new =  customerStatesRepo.findByCustomerStatusCode(transaction.getCustomerStatusCodeTo());
        Customer customer = customerRepo.findByCustomerId(transaction.getCustomerId());

        int payment_amount = 0;

        if(state_new.getIsPaymentType()==1 && state_new.getExplicitPaymentType()==0) {
            List<CustomerStateTransactions> custTransactions = customerStateTransactionsRepo.findByCustomerIdOrderByTransactTimeStampAsc(transaction.getCustomerId());
            for (CustomerStateTransactions custTransaction : custTransactions) {
                if (custTransaction.getCustomerStatusCodeTo().equalsIgnoreCase(state_new.getCustomerStatusCode())) {
                    throw new CrmException("Transaction Already Exists for this Customer");
                }
            }
            customer.setReportTaken("yes");
            customer.setReportDate(LocalDate.now());
            payment_amount = state_new.getPaymentAmount();
        }

        if(state_new.getIsPaymentType()==1 && state_new.getExplicitPaymentType()==1) {
            List<CustomerStateTransactions> custTransactions = customerStateTransactionsRepo.findByCustomerIdOrderByTransactTimeStampAsc(transaction.getCustomerId());
            for (CustomerStateTransactions custTransaction : custTransactions) {
                if (custTransaction.getCustomerStatusCodeTo().equalsIgnoreCase(state_new.getCustomerStatusCode())) {
                    throw new CrmException("Transaction Already Exists for this Customer");
                }
            }
            if(full_payment_amount==null || Integer.parseInt(full_payment_amount)<=0){
                throw new CrmException("Invalid payment amount added");
            }
            customer.setPaidFullPayment("yes");
            customer.setFullPaymentDate(LocalDate.now());
            payment_amount = Integer.parseInt(full_payment_amount);
        }

//        CustomerStates state_old =  customerStatesRepo.findByCustomerStatusCode(customer.getCustomerStatusCode());

        if(state_new.getCustomerStatus().equalsIgnoreCase("IFP")){
            customer.setFullPaymentInterested("yes");
        }
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
        String regex = "CUS-"+LocalDate.now().toString().replace("-","")+"-";
        long count = customerPaymentsRepo.findCountOfCustomerPaymentsLike(regex+"%");
        return regex+(count+1);
    }

    public List<CustomerStateTransactions> getCustomerTransactions(String customerId){
        return customerStateTransactionsRepo.findByCustomerIdOrderByTransactTimeStampAsc(customerId);
    }

    public List<CustomerPayments> getCustomerPayments(String customerId){
        return customerPaymentsRepo.findByCustomerIdOrderByTransactionDateAsc(customerId);
    }

    public List<CustomerScoreHistory> getCustomerScoreHistory(String customerId){
        return customerScoreHistoryRepo.findByCustomerIdOrderByAddedDateAsc(customerId);
    }

    @Transactional
    public CustomerScoreHistory addCustomerScoreHistory(CustomerScoreHistory scoreHistory){
        Customer customer = customerRepo.findByCustomerId(scoreHistory.getCustomerId());
        List<CustomerScoreHistory> ScoreHistory = customerScoreHistoryRepo.findByCustomerIdOrderByAddedDateAsc(scoreHistory.getCustomerId());

        if(ScoreHistory==null || ScoreHistory.isEmpty()){
            customer.setOpenCibilScore(scoreHistory.getScore());
            customer.setOpenDate(scoreHistory.getScoreDate());
        }else {
            customer.setCloseCibilScore(scoreHistory.getScore());
            customer.setCloseDate(scoreHistory.getScoreDate());
        }
        customerRepo.save(customer);

        customerScoreHistoryRepo.save(scoreHistory);

        return scoreHistory;
    }

    public long customerDelete(String customerId){

        Customer customer = customerRepo.findByCustomerId(customerId);
        customer.setIsActive(0);
        customerRepo.save(customer);
        return customer.getId();
    }
}
