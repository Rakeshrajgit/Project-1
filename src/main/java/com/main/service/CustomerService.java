package com.main.service;

import com.main.model.Customer;
import com.main.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepo customerRepo;

    public List<Customer> getAllCustomer(){
        return customerRepo.findAll();
    }

    public Customer getCustomerByAppNo(Integer AppNo){
        return customerRepo.findByAppNo(AppNo);
    }
}
