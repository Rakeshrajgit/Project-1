package com.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.main.model.Application;

@Repository

public interface AppRepo extends JpaRepository<Application,Integer> {
	
//@Query
//public Application login(String firstname , String gmail);	
	

}
