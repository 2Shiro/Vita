package com.vita.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.oauth.jwt.JWTUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class GetUserIdService {

	 @Autowired
	    private JWTUtil jwtUtil;

	    public Long getId(HttpServletRequest request) {
	        String accessToken = null;
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("access".equals(cookie.getName())) {
	                	accessToken = cookie.getValue();
	                    break;
	                }
	            }
	        }

	        // refresh 토큰이 있다면 userId 추출
	        if (accessToken != null) {
	            return jwtUtil.getUserId(accessToken);
	        } else {
	            return null;
	        }
	    }
}
