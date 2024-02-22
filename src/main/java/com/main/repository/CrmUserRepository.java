package com.main.repository;

import com.main.model.CrmUser;
import com.main.model.LoginStamping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CrmUserRepository extends JpaRepository<CrmUser,Long> {
	
	
    CrmUser findByUserEmail(String userEmail);
    CrmUser findByUserId(String userId);
    List<CrmUser> findByRole(String role);

    @Query("SELECT COUNT(*) FROM CrmUser WHERE userId LIKE :userId")
    long findCountByUserIdLike(@Param("userId") String userId);

}
