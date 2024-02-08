package com.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.main.model.AdminModel;
import com.main.model.Manager;


@Repository
@EnableJpaRepositories
public interface ManagerRepo extends JpaRepository<Manager, Long> {
	

	@Query
	public Manager findByEmailAndPassword(String email,String password);

}
