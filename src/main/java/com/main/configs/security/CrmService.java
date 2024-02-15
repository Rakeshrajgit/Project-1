package com.main.configs.security;

import com.main.model.CrmUser;
import com.main.model.LoginStamping;
import com.main.repository.CrmUserRepository;
import com.main.repository.LoginStampingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class CrmService {

    @Autowired
    private LoginStampingRepo loginStampingRepo;

    @Autowired
    private CrmUserRepository crmUserRepository;
    public void LoginStampingInsert(LoginStamping loginStamping){
        loginStampingRepo.save(loginStamping);
    }

    public CrmUser findUserByEmail(String userMail){
        return crmUserRepository.findByUserEmail(userMail);
    }

    public void logoutStampingUpdate(String userId) throws Exception {
        LoginStamping stamping=loginStampingRepo.findLatestIdByUserId(userId).get();
        stamping.setLogoutDateTime(LocalDateTime.now());
        loginStampingRepo.save(stamping);
    }

}
