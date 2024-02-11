package com.main.configs.security;

import com.main.model.CrmUser;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserDetailsService {
    @Autowired
    private CrmUserRepository loginRepository;

    @Override
    @Transactional(readOnly = false)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("User email is : "+username);
        CrmUser login = loginRepository.findByUserEmail(username);
        if (login != null && login.getIsActive() == 1) {
            Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
            grantedAuthorities.add(new SimpleGrantedAuthority(login.getRole().getRoleName()));
            return new org.springframework.security.core.userdetails.User(login.getUserEmail(), login.getPassword(), grantedAuthorities);
        } else {
            throw new UsernameNotFoundException("User not found");
        }
    }


}