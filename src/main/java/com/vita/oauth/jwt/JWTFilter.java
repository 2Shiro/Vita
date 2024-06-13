package com.vita.oauth.jwt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;

import com.vita.jwt.service.CustomUserDetails;
import com.vita.jwt.service.CustomUserDetailsService;
import com.vita.jwt.service.TokenRotate;
import com.vita.oauth.domain.CustomOAuth2User;
import com.vita.oauth.domain.UserDTO;
import com.vita.oauth.domain.UserVo;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JWTFilter extends OncePerRequestFilter {

	private final JWTUtil jwtUtil;
	private final CustomUserDetailsService customUserDetailsService;
   

	public JWTFilter(JWTUtil jwtUtil, CustomUserDetailsService customUserDetailsService) {

		this.jwtUtil = jwtUtil;
		this.customUserDetailsService = customUserDetailsService;
		
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		//System.out.println("jwt 필터로 옴");

		// 쿠키에서 access 토큰 가져오기
				//System.out.println("여기서오류인가~~~~~~~~~~~~");
				String token = null;
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if ("access".equals(cookie.getName())) {
							token = cookie.getValue();
							break;
						}
					}
				}
				if (token == null) {
					System.out.println("토큰이 없음 또는 잘못된 토큰 형식");
					filterChain.doFilter(request, response);
					return;
				}

	        // Bearer 부분 제거 후 순수 토큰만 획득
	       // String token = authorization.substring(7).trim();
	        //System.out.println(token);
	        
	        
	        
	        

				try {
				    jwtUtil.isExpired(token);
				} catch (ExpiredJwtException e) {

				    //response body
				    PrintWriter writer = response.getWriter();
				    writer.print("access token expired");

				    //response status code
				    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				    return;
				}

	             
	        
	        


	       // System.out.println("2222222222222222222222222222222222222");
	      //  System.out.println("888888888888888888888888");
		// 토큰에서 username과 role 획득
		String email = jwtUtil.getUserEmail(token);
	
		String role = jwtUtil.getRole(token);
		
		Long user_id = jwtUtil.getUserId(token);
	
		String name = jwtUtil.getName(token);
		
		String oauth = jwtUtil.getOauth(token);

		// userDTO를 생성하여 값 set
		/*
		 * UserDTO userDTO = new UserDTO(); userDTO.setUsername(oauth_name);
		 * userDTO.setRole(role); userDTO.setUserId(user_id);
		 */
		
		//userVo로 다시 생성함 원래 userDto 엿음 -----------이거해야함
		UserVo userVo = new UserVo();
		userVo.setEmail(email);
		userVo.setRole(role);
		userVo.setId(user_id);
		userVo.setName(name);
	
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURI());
		 // 일반 로그인 토큰인지 OAuth2 토큰인지 확인 후 처리
        if (isOAuth2User(token)&& request.getRequestURI().equals("/home")) {
        	System.out.println("오스로그인으로옴");
        
            // OAuth2 토큰 처리
            CustomOAuth2User customOAuth2User = new CustomOAuth2User(userVo);
            Authentication authToken = new UsernamePasswordAuthenticationToken(customOAuth2User, null, customOAuth2User.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authToken);
            
         
            response.sendRedirect("/");
            // 단순히 성공 응답만 반환
			/*
			 * response.setStatus(HttpServletResponse.SC_OK);
			 * response.setContentType("application/json");
			 * response.getWriter().print("{\"message\": \"OAuth2 login successful\"}");
			 */
            
            return;
        } else {
        	
        	if(isOAuth2User(token)) {
        		System.out.println("오스로그인처리");
        		  CustomOAuth2User customOAuth2User = new CustomOAuth2User(userVo);
                  Authentication authToken = new UsernamePasswordAuthenticationToken(customOAuth2User, null, customOAuth2User.getAuthorities());
                  SecurityContextHolder.getContext().setAuthentication(authToken);
        	}else{
        		System.out.println("일반 로그인 토큰 처리");
                // 일반 로그인 토큰 처리
                CustomUserDetails customUserDetails = (CustomUserDetails) customUserDetailsService.loadUserByUsername(email);
                Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(authToken);
             //   System.out.println("23333333333333333333333");
        		
        	}
        	
        }
		

		filterChain.doFilter(request, response);
	}
	 private boolean isOAuth2User(String token) {
	        // OAuth2 토큰 여부를 확인하는 로직 (예: 토큰의 특정 클레임을 확인)
		
		
		 System.out.println(jwtUtil.getOauth(token).equals("oauth"));
	        return jwtUtil.getOauth(token).equals("oauth");
	    }
}