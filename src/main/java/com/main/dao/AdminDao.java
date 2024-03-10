package com.main.dao;

import com.main.dto.AgentCollectionDto;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Transactional
@Repository
public class AdminDao {

    @PersistenceContext
    private EntityManager manager;

    public static final String  GetAgentCollectionData= "CALL db_collection_data (:userId, :userType, :fromDate, :toDate)";
    public List<AgentCollectionDto> getAgentCollectionData(String userId, String userType, LocalDate fromDate, LocalDate toDate){
        Query query =manager.createNativeQuery(GetAgentCollectionData,"AgentCollectionDtoMapping");
        query.setParameter("userId",userId);
        query.setParameter("userType",userType);
        query.setParameter("fromDate",fromDate);
        query.setParameter("toDate",toDate);

        List<AgentCollectionDto> agentCollectionDtos = query.getResultList();
        return agentCollectionDtos;
    }

}
