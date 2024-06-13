package com.vita.jwt.service;

import org.springframework.stereotype.Service;

import com.vita.oauth.jwt.JWTUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.io.IOException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class TokenRotate {
	private final JWTUtil jwtUtil;

    public TokenRotate(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    public void handleExpiredAccessToken(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        System.out.println("토큰로테이트 실행됨");
        // get refresh token
        String refresh = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("refresh".equals(cookie.getName())) {
                    refresh = cookie.getValue();
                    break;
                }
            }
        }
        System.out.println("refresh쿠키 가지고옴 : " + refresh);

        if (refresh == null) {
            // response status code
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            System.out.println("refresh token null");
            
            return;
        }
        System.out.println("어디서문제지1");
        // expired check
        try {
            jwtUtil.isExpired(refresh);
        } catch (ExpiredJwtException e) {
            // response status code
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            System.out.println("refresh token expired");
            return;
        }
        System.out.println("어디서문제지2");
        // 토큰이 refresh인지 확인 (발급시 페이로드에 명시)
        String category = jwtUtil.getCategory(refresh);
        if (!"refresh".equals(category)) {
            // response status code
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            System.out.println("invalid refresh token");
            
            return;
        }
        System.out.println("어디서문제지3");
        
        String username = jwtUtil.getUserEmail(refresh);
        String role = jwtUtil.getRole(refresh);
        Long userId = jwtUtil.getUserId(refresh);
        String name = jwtUtil.getName(refresh);
        int accessTokenValiditySeconds = 600; // 600초 = 10분
        int refreshTokenValiditySeconds = 86400; // 86400초 = 24시간
        // make new JWT
        String newAccess = jwtUtil.createJwt("access", username, role, (long) accessTokenValiditySeconds * 1000, userId, name);
       
        // add new access token to the response cookies
        System.out.println("어디서문제지4");
        CookieUtil.createCookie(response, "access", newAccess, refreshTokenValiditySeconds, false);
        System.out.println("어디서문제지5");
        response.setStatus(HttpServletResponse.SC_OK);
    }

    
}
