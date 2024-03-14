package com.main.service;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.repository.CrmUserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        user.setUserId(generateUserId(user.getRole()));
        return crmUserRepository.save(user);
    }

    private String generateUserId(String role){
        String userIdPrefix="";
        if(role.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
            userIdPrefix = "ADM-";
        } else if (role.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
            userIdPrefix = "MAN-";
        } else if (role.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())) {
            userIdPrefix = "AGE-";
        }
        long userNo= crmUserRepository.findCountByUserIdLike(userIdPrefix+"%");
        String userId=userIdPrefix+(userNo+1);
        return userId;
    }

    public CrmUser getUserByEmail(String userEmail){
        return crmUserRepository.findByUserEmail(userEmail);
    }
    public boolean checkUserEmailExists(String userEmail){
        CrmUser user = getUserByEmail(userEmail);
        return user==null;
    }


    public List<CrmUser> getAllUsers(){
        return crmUserRepository.findByIsActive(1);
    }

    public Map<String, CrmUser> getAllUsersMap(){

        List<CrmUser> crmUsers = getAllUsers();
        Map<String, CrmUser> crmUserHashMap= new HashMap<>();
        crmUsers.forEach(user-> crmUserHashMap.put(user.getUserId(),user));
        return crmUserHashMap;
    }

    public long deleteUser(String userId) {

        CrmUser  crmUser= crmUserRepository.findByUserId(userId);
        crmUser.setIsActive(0);
        crmUserRepository.save(crmUser);

        return crmUser.getId();
    }

    public long updateUser(CrmUser crmUser) {
        CrmUser userOrg =  crmUserRepository.findByUserId(crmUser.getUserId());
        userOrg.setUserEmail(crmUser.getUserEmail());
        userOrg.setUserName(crmUser.getUserName());
        userOrg.setPassword(crmUser.getPassword());
        crmUserRepository.save(userOrg);
        return userOrg.getId();
    }
}
