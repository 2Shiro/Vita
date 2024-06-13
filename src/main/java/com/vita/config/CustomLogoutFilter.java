package com.vita.config;

import org.springframework.web.filter.GenericFilterBean;

import com.vita.jwt.service.RefreshTokenService;
import com.vita.oauth.jwt.JWTUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.io.IOException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CustomLogoutFilter extends GenericFilterBean{
	  private final JWTUtil jwtUtil;
	    private final RefreshTokenService refreshTokenService;

	    public CustomLogoutFilter(JWTUtil jwtUtil, RefreshTokenService refreshTokenService) {

	        this.jwtUtil = jwtUtil;
	        this.refreshTokenService = refreshTokenService;
	    }

	    @Override
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException, java.io.IOException {

	        doFilter((HttpServletRequest) request, (HttpServletResponse) response, chain);
	    }

	    private void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException, java.io.IOException {

	    	System.out.println("로그아웃 필터까지 오나?");
	        //path and method verify
	        String requestUri = request.getRequestURI();
	        if (!requestUri.matches("^\\/logout$")) {

	            filterChain.doFilter(request, response);
	            return;
	        }
	        String requestMethod = request.getMethod();
	        if (!requestMethod.equals("POST")) {

	            filterChain.doFilter(request, response);
	            return;
	        }
	        System.out.println("로그아웃 밑에까지 실행이되나 오나?");
	        //get refresh token
	        String refresh = null;
	        String access = null;
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("refresh")) {
	                    refresh = cookie.getValue();
	                } else if (cookie.getName().equals("access")) {
	                    access = cookie.getValue();
	                }
	            }
	        }
	        System.out.println("refresh쿠키가 있나 ? " + refresh);
	        System.out.println("acesss쿠키가 있나 ? " + access);
	        //refresh null check
	        if (refresh == null) {

	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        //expired check
	        try {
	            jwtUtil.isExpired(refresh);
	        } catch (ExpiredJwtException e) {

	            //response status code
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        // 토큰이 refresh인지 확인 (발급시 페이로드에 명시)
	        String category = jwtUtil.getCategory(refresh);
	        if (!category.equals("refresh")) {

	            //response status code
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        //DB에 저장되어 있는지 확인
	        Boolean isExist = refreshTokenService.existsByRefresh(refresh);
	        if (!isExist) {

	            //response status code
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        //로그아웃 진행
	        //Refresh 토큰 DB에서 제거
	        refreshTokenService.deleteByRefresh(refresh);

	        
	      
	        //Refresh 토큰 Cookie 값 0
	        Cookie refreshCookie  = new Cookie("refresh", null);
	        refreshCookie.setMaxAge(0);
	        refreshCookie.setPath("/");
	        
	        Cookie accessCookie  = new Cookie("access", null);
	        accessCookie.setMaxAge(0);
	        accessCookie.setPath("/");
	        
	        
	        response.addCookie(refreshCookie);
	        response.addCookie(accessCookie);
	        
	        response.setStatus(HttpServletResponse.SC_OK);
	      
	    }
}
