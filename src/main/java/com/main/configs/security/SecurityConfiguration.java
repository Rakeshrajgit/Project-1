package com.main.configs.security;


import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.vote.AuthenticatedVoter;
import org.springframework.security.access.vote.RoleVoter;
import org.springframework.security.access.vote.UnanimousBased;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.expression.WebExpressionVoter;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfiguration {

    private final AuthenticationProvider authenticationProvider;

    private UserDetailsService userDetailsService;
    @Bean
    public SecurityFilterChain securityFilterChain (HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(authorize ->
                        authorize
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/")).hasAnyRole("USER", "ADMIN")
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/LoginPage/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/webresources/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/view/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/webjars/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/login")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/manager/managerLogin")).permitAll()
                                .anyRequest().authenticated()
                ).authenticationProvider(authenticationProvider)
                .formLogin(form -> form.loginPage("/login")
                        .permitAll()
                )
                .logout(logout -> logout
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .logoutSuccessUrl("/login?logout=1")
                        .addLogoutHandler(logoutSuccessHandler())
                ).exceptionHandling(exception -> exception
                        .accessDeniedPage("/accessdenied")
                )
                .csrf(Customizer.withDefaults())
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .invalidSessionUrl("/login?session=1")
                )
                .headers(header -> header.cacheControl(cache-> cache.disable()));


        return http.build();
    }


    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
        builder.userDetailsService(userDetailsService);
//                .passwordEncoder(passwordencoder());
    }

    public PasswordEncoder passwordencoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public LogoutHandler logoutSuccessHandler() {
        return new CustomLogoutHandler();
    }

}