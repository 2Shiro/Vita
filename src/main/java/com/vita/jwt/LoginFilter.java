package com.vita.jwt;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.vita.jwt.service.CookieUtil;
import com.vita.jwt.service.CustomUserDetails;
import com.vita.jwt.service.RefreshTokenService;
import com.vita.oauth.domain.RefreshDTO;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.oauth.mapper.RefreshMapper;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginFilter extends UsernamePasswordAuthenticationFilter {
	
	 private final AuthenticationManager authenticationManager;
	 private final JWTUtil jwtUtil;
	 private final RefreshTokenService refreshTokenService;

	    public LoginFilter(AuthenticationManager authenticationManager, JWTUtil jwtUtil, RefreshTokenService refreshTokenService) {

	        this.authenticationManager = authenticationManager;
	        this.jwtUtil = jwtUtil;
	        this.refreshTokenService = refreshTokenService;
	    }

	    @Override
	    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {

					//클라이언트 요청에서 username, password 추출
	        String username = obtainUsername(request);
	        String password = obtainPassword(request);
	        
	        System.out.println("username 이 오나 ? : " + username);
	        System.out.println("password 이 오나 ? : " + password);

					//스프링 시큐리티에서 username과 password를 검증하기 위해서는 token에 담아야 함
	        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(username, password, null);

					//token에 담은 검증을 위한 AuthenticationManager로 전달
	        return authenticationManager.authenticate(authToken);
	    }

			//로그인 성공시 실행하는 메소드 (여기서 JWT를 발급하면 됨)
	    @Override
	    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException {

	    	System.out.println("로그인성공핸들러로 옴");
	    	//성공핸들러까지는 오나 ?
			//UserDetailsS
	        CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();

	        String username = customUserDetails.getUsername();
	        

	        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
	        Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
	        GrantedAuthority auth = iterator.next();

	        String role = auth.getAuthority();
	        Long userId = customUserDetails.getId();
	        String name = customUserDetails.getName();
	        int accessTokenValiditySeconds = 600; // 600초 = 10분
	        int refreshTokenValiditySeconds = 86400; // 86400초 = 24시간
	        
	      //access토큰 
	        String access = jwtUtil.createJwt("access", username, role, (long) refreshTokenValiditySeconds * 1000, userId, name);
	        System.out.println("access 값이 들어가나?"+access);
	        String refresh = jwtUtil.createJwt("refresh", username, role, (long) refreshTokenValiditySeconds * 1000, userId, name);
	        System.out.println("refresh 값이 들어가나?"+refresh);
	        
	        System.out.println("리프레쉬테스트 : " + refresh);
	        addRefreshDTO(username, refresh, refreshTokenValiditySeconds * 1000L, userId);
	        System.out.println("리프레쉬테스트333333333 : " + refresh);
	        //String redirectURL = "/loginsuccess?access=" + URLEncoder.encode(access, "UTF-8") + "&refresh=" + URLEncoder.encode(refresh, "UTF-8");
	        System.out.println("로그인시 access토큰이 잘저장되었나 ? : " + access);
	        // 응답 설정
	        
	       // Cookie accessCookie = CookieUtil.createCookie("access", access, accessTokenValiditySeconds);
	        CookieUtil.createCookie(response, "refresh", refresh, refreshTokenValiditySeconds, true);
	        CookieUtil.createCookie(response, "access", access, refreshTokenValiditySeconds, false);
	      
	       // response.addHeader("Authorization", "Bearer " + access);
	        
	        // 클라이언트에게 로그인 성공을 알리고 JWT 토큰을 전달합니다.
			/*
			 * response.setContentType("application/json");
			 * response.setCharacterEncoding("UTF-8");
			 * response.getWriter().write("{\"token\": \"" + access + "\"}");
			 */
	        response.sendRedirect("/home");
	    }

			//로그인 실패시 실행하는 메소드
	    @Override
	    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) {
	    	System.out.println("로그인실패 핸들러로옴");
	    	response.setStatus(401);
	    }
	    private void addRefreshDTO(String username, String refresh, Long expiredMs, Long userId) {

	        Date date = new Date(System.currentTimeMillis() + expiredMs);

	        RefreshDTO refreshDto = new RefreshDTO();
	        refreshDto.setUsername(username);
	        refreshDto.setRefresh(refresh);
	        refreshDto.setExpiration(date.toString());
	        refreshDto.setId(userId);
	        refreshTokenService.invalidateOldTokens(userId);
	        refreshTokenService.saveRefrechToken(refreshDto);
	    }
	    
	  
}
