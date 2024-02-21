package com.main.configs.database;

import com.main.model.CrmUser;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

public class AuditorAwareImpl implements AuditorAware<String> {

    @Autowired
    ObjectFactory<HttpSession> httpSessionFactory;
    @Override
    public Optional<String> getCurrentAuditor() {
        HttpSession session = httpSessionFactory.getObject();
        return Optional.of((String)session.getAttribute("userId"));
    }
}