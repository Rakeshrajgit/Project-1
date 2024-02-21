package com.main.service;

import com.main.dto.AccessControlDto;
import com.main.repository.accesscontrol.AccessControlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccessControlService {

    @Autowired
    private AccessControlDao accessControlDao;

    public List<AccessControlDto> getAccessControlDto(String userType){
        List<Object[]> accessUrlList = accessControlDao.getAccessControlDto(userType);
        List<AccessControlDto> accessControlDtoList = new ArrayList<>();
        for(Object[] accessUrl :accessUrlList){
            AccessControlDto accessControlDto = AccessControlDto.builder()
                    .FormDetailId(Long.parseLong(accessUrl[0].toString()))
                    .FormModuleId(Long.parseLong(accessUrl[1].toString()))
                    .FormModuleName(accessUrl[2].toString())
                    .ModuleUrl(accessUrl[3]==null?null:accessUrl[3].toString())
                    .FormName(accessUrl[4].toString())
                    .FormUrl(accessUrl[5].toString())
                    .build();
            accessControlDtoList.add(accessControlDto);
        }
        return accessControlDtoList;
    }

    public Map<Long,String> getModulesForUserType(List<AccessControlDto> accessControlDtos){
        Map<Long, String> modules = new HashMap<>();

        for(AccessControlDto accessUrl : accessControlDtos){
            modules.put(accessUrl.getFormModuleId(),accessUrl.getFormModuleName());
        }
        return modules;
    }


}
