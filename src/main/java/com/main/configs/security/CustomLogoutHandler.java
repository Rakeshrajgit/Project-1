package com.main.configs.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

public class CustomLogoutHandler implements LogoutHandler {

    @Autowired
    private CrmService crmService;

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        HttpSession ses = request.getSession();
        try {
            crmService.logoutStampingUpdate((String)ses.getAttribute("userId"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}