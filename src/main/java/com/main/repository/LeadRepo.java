package com.main.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.main.model.LeadForm;

public interface LeadRepo extends JpaRepository<LeadForm, Long> {
	
	LeadForm findByLeadId(String leadId);
    List<LeadForm> findByUserId(String userId);
	List<LeadForm> findByLeadIdIsNull();
	
	
	 @Query("SELECT COUNT(*) FROM LeadForm WHERE userId LIKE :userId")
	    long findCountByLeadIdLike(@Param("userId") String userId);

}
