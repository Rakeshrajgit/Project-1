package com.main.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;


import com.main.model.CSupport;



@Repository
@EnableJpaRepositories
public interface CSRepo extends JpaRepository<CSupport, Long> {
	
	@Query
	public CSupport findByEmailAndPassword(String email,String password);


}
