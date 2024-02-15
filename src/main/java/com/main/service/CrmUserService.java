package com.main.service;

import com.main.model.CrmUser;
import com.main.repository.CrmUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CrmUserService {

    @Autowired
    private CrmUserRepository crmUserRepository;

    public List<CrmUser> getUsersByRole(String role){
        System.out.println( crmUserRepository.findByRole(role).size());
        return crmUserRepository.findByRole(role);
    }
}
