package com.vita.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.web.OAuth2LoginAuthenticationFilter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutFilter;

import com.vita.jwt.LoginFilter;
import com.vita.jwt.service.CustomUserDetailsService;
import com.vita.jwt.service.RefreshTokenService;
import com.vita.jwt.service.TokenRotate;
import com.vita.oauth.jwt.JWTFilter;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.oauth.mapper.RefreshMapper;
import com.vita.oauth.service.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity(debug = false)
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;
    private final CustomSuccessHandler customSuccessHandler;
    private final JWTUtil jwtUtil;
    private final CustomUserDetailsService customUserDetailsService;
    private final AuthenticationConfiguration authenticationConfiguration;
    private final RefreshTokenService refreshTokenService;
    private final TokenRotate tokenRotate;

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService, CustomSuccessHandler customSuccessHandler,
                          JWTUtil jwtUtil, CustomUserDetailsService customUserDetailsService,
                          AuthenticationConfiguration authenticationConfiguration, RefreshTokenService refreshTokenService, TokenRotate tokenRotate) {
        this.customOAuth2UserService = customOAuth2UserService;
        this.customSuccessHandler = customSuccessHandler;
        this.jwtUtil = jwtUtil;
        this.customUserDetailsService = customUserDetailsService;
        this.authenticationConfiguration = authenticationConfiguration;
        this.refreshTokenService = refreshTokenService;
        this.tokenRotate = tokenRotate;
        
    }

    // AuthenticationManager Bean 등록
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    // 스프링 시큐리티 기능 비활성화 (제외 설정)
    @Bean
    public WebSecurityCustomizer configure() {
        return (web) -> web.ignoring()
                .requestMatchers("/")
                .requestMatchers("/login")
                .requestMatchers("/redirectHome")
                .requestMatchers("/css/**")
                .requestMatchers("/js/**")
                .requestMatchers("/img/**")
                .requestMatchers("/images/**")
                .requestMatchers("/WEB-INF/**")
                .requestMatchers("/token/retoken")
                .requestMatchers("token/loginsuccess")
                .requestMatchers("/token/loginsuccess")
                .requestMatchers("/loginsuccess")
                .requestMatchers("/favicon.ico")
                .requestMatchers("/login/WriteForm")
                .requestMatchers("/login/write")
                .requestMatchers("/reissue")
                .requestMatchers("/welcome");
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // csrf disable
        http.csrf((auth) -> auth.disable());

        // From 로그인 방식 disable
        http.formLogin((auth) -> auth.disable());

        // HTTP Basic 인증 방식 disable
        http.httpBasic((auth) -> auth.disable());

        // JWTFilter 추가
        http.addFilterBefore(new JWTFilter(jwtUtil, customUserDetailsService, tokenRotate), UsernamePasswordAuthenticationFilter.class);

        // oauth2
        http.oauth2Login((oauth2) -> oauth2
                .userInfoEndpoint((userInfoEndpointConfig) -> userInfoEndpointConfig
                        .userService(customOAuth2UserService))
                .successHandler(customSuccessHandler)
        );

        // 경로별 인가 작업
        http.authorizeHttpRequests((auth) -> auth
                .requestMatchers("/", "/home.jsp", "/home").permitAll()
                .requestMatchers("/reissue").permitAll()
                .requestMatchers("/ffdd").permitAll()
                .anyRequest().authenticated()
        );

        LoginFilter loginFilter = new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil, refreshTokenService);
        loginFilter.setFilterProcessesUrl("/ffdd");
        http.addFilterAt(loginFilter, UsernamePasswordAuthenticationFilter.class);
        
        http
        .addFilterBefore(new CustomLogoutFilter(jwtUtil, refreshTokenService), LogoutFilter.class);

        // 세션 설정 : STATELESS
        http.sessionManagement((session) -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        );

        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}