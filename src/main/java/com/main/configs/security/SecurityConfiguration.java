package com.main.configs.security;


import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

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
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/")).hasAnyRole("USER", "ADMIN","MANAGER","AGENT")
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/LoginPage/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/webresources/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/view/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/webjars/**")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/login")).permitAll()
                                .requestMatchers(AntPathRequestMatcher.antMatcher("/BulkUploadLeads.htm")).permitAll()
                                .anyRequest().authenticated()
                ).authenticationProvider(authenticationProvider)
                .formLogin(form -> form.loginPage("/login")
                        .defaultSuccessUrl("/welcome",true)
                        .failureUrl("/login?error=1")
                        .permitAll().usernameParameter("username")
                        .passwordParameter("password")
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

    @Bean
    public LogoutHandler logoutSuccessHandler() {
        return new CustomLogoutHandler();
    }

}