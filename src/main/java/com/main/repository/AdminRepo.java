package com.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.main.model.AdminModel;


@Repository
@EnableJpaRepositories
public interface AdminRepo  extends JpaRepository<AdminModel,Integer> {
	
	@Query
	public AdminModel findByEmailAndPassword(String email,String password);

}
