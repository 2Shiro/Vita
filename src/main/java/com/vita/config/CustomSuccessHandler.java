package com.vita.config;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.vita.jwt.service.CookieUtil;
import com.vita.jwt.service.RefreshTokenService;
import com.vita.oauth.domain.CustomOAuth2User;
import com.vita.oauth.domain.RefreshDTO;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.oauth.mapper.RefreshMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final JWTUtil jwtUtil;
    private final RefreshTokenService refreshTokenService;

    public CustomSuccessHandler(JWTUtil jwtUtil, RefreshTokenService refreshTokenService) {

        this.jwtUtil = jwtUtil;
        this.refreshTokenService = refreshTokenService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

    	System.out.println("onAuthenticationSuccess");
    	System.out.println("일반로그인은 일로오나마지막?");
    	System.out.println("일반로그인은 일로오나마지막?");
    	System.out.println("일반로그인은 일로오나마지막?");
        //OAuth2User
        CustomOAuth2User customUserDetails = (CustomOAuth2User) authentication.getPrincipal();

        String username = customUserDetails.getOAuthEmail();
        

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
        GrantedAuthority auth = iterator.next();
        String role = auth.getAuthority();
        Long userId = customUserDetails.getUserId();
        String name = customUserDetails.getName();
        String oauth = customUserDetails.getOauth();
        int accessTokenValiditySeconds = 600; // 600초 = 10분
        int refreshTokenValiditySeconds = 86400; // 86400초 = 24시간
     
        //access토큰 600000
        String access = jwtUtil.createJwt("access", username, role, (long) refreshTokenValiditySeconds * 1000, userId, name, oauth);
        System.out.println("access 값이 들어가나?"+access);
        String refresh = jwtUtil.createJwt("refresh", username, role, (long) refreshTokenValiditySeconds * 1000, userId, name, oauth);
        System.out.println("refresh 값이 들어가나?"+refresh);
        
        addRefreshDTO(username, refresh,  refreshTokenValiditySeconds * 1000L, userId);
        
       
        // 쿠키 설정
         //createCookie(response, "access", access, accessTokenValiditySeconds);
         CookieUtil.createCookie(response, "refresh", refresh, refreshTokenValiditySeconds, true);
         CookieUtil.createCookie(response, "access", access, refreshTokenValiditySeconds, false);
      
        
        // access 토큰을 쿼리 매개변수로 포함하여 리다이렉트 URL 설정
		/*
		 * String redirectURL = "/token/loginsuccess?access=" +
		 * URLEncoder.encode(access, "UTF-8"); response.sendRedirect(redirectURL);
		 */
        
        String redirectURL = "/home";
        response.sendRedirect(redirectURL);
        // access 토큰을 쿼리 매개변수로 전달
		/*
		 * String redirectURL = request.getContextPath() + "/welcome?access=" +
		 * URLEncoder.encode(access, "UTF-8");
		 * 
		 * // 새로운 URL로 리디렉션 response.sendRedirect(redirectURL);
		 */
       // response.setHeader("Authorization", "Bearer" + token);
        //response.sendRedirect("/token/retoken");
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
    // 쿠키 생성 메서드
    private void createCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setSecure(true);
        cookie.setPath("/");
        
        // 쿠키를 응답에 추가
        response.addCookie(cookie);
    }
    
	 
}