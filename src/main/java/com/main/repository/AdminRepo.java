package com.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.main.model.CrmUser;


public interface AdminRepo extends JpaRepository<CrmUser, Long>{

	
    List<CrmUser> findByUserId(String userId);
	List<CrmUser> findByUserIdIsNull();
	
}
