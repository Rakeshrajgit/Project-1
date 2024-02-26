package com.main.service;

import com.main.configs.enums.UserTypes;
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
        return crmUserRepository.findByRole(role);
    }
    public CrmUser getUsersByUserId(String userId){
        return crmUserRepository.findByUserId(userId);
    }

    public CrmUser saveCrmUser(CrmUser user){
        String userId = generateUserId(user.getRole());
        user.setUserId(userId);
        return crmUserRepository.save(user);
    }
    
    
    
    
    private String generateUserId(String role){
        String userIdPrefix="";
        if(role.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
            userIdPrefix = "ADM";
        } else if (role.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
            userIdPrefix = "MAN";
        } else if (role.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())) {
            userIdPrefix = "AGE";
        }
        long userNo= crmUserRepository.findCountByUserIdLike(userIdPrefix+"%");
        String userId=userIdPrefix+"-"+(userNo+1);
        return userId;
    }
    

    public CrmUser getUserByEmail(String userEmail){
        return crmUserRepository.findByUserEmail(userEmail);
    }
    public boolean checkUserEmailExists(String userEmail){
        CrmUser user = getUserByEmail(userEmail);
        return user==null;
    }
}
