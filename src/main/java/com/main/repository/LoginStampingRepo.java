package com.main.repository;

import com.main.model.LoginStamping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface LoginStampingRepo extends JpaRepository<LoginStamping,Long> {

    @Query("select a from LoginStamping a where a.id = (select max(b.id) from LoginStamping b where b.userId = :userId)")
    Optional<LoginStamping> findLatestIdByUserId(@Param("userId") String userId);

}
