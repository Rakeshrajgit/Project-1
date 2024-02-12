package com.main.configs.security;

import com.main.model.CrmUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CrmUserRepository extends JpaRepository<CrmUser,Long> {
    CrmUser findByUserEmail(String userEmail);
}