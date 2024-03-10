package com.main.service;

import com.main.dao.AdminDao;
import com.main.dto.AgentCollectionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;

    public Map<LocalDate, Long> getAgentCollectionData(String userId, String userType, LocalDate fromDate, LocalDate toDate){

        LocalDate tempToDate = LocalDate.parse(toDate.toString());
        List<AgentCollectionDto> agentCollection=adminDao.getAgentCollectionData(userId,userType,fromDate,toDate);

        Map<LocalDate, Long> dateAmountMap =  new LinkedHashMap<>();
        while(fromDate.isBefore(toDate) || fromDate.isEqual(toDate) ){
            dateAmountMap.put(fromDate,0L);
            fromDate = fromDate.plusDays(1);
        }


        for(AgentCollectionDto collection : agentCollection){

           dateAmountMap.put(collection.getPaymentDate(), collection.getTotalPayment());
        }

        return dateAmountMap;
    }
}
