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
    private final TokenRotate tokenRotate;

	public JWTFilter(JWTUtil jwtUtil, CustomUserDetailsService customUserDetailsService, TokenRotate tokenRotate) {

		this.jwtUtil = jwtUtil;
		this.customUserDetailsService = customUserDetailsService;
		this.tokenRotate = tokenRotate;
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
	            // 토큰 만료 여부 확인
	            jwtUtil.isExpired(token);
	        } catch (ExpiredJwtException e) {
	            System.out.println("토큰 만료됨");
	            try {
	                System.out.println("새로운 토큰 만들기중");
	                tokenRotate.handleExpiredAccessToken(request, response);

	                // 새로운 토큰을 발급한 후, 새로운 토큰으로 계속 처리
	                token = null;
	                Cookie[] recookies = request.getCookies();
	                if (recookies != null) {
	                    for (Cookie cookie : recookies) {
	                        if ("access".equals(cookie.getName())) {
	                            token = cookie.getValue();
	                            break;
	                        }
	                    }
	                }

	                if (token == null) {
	                    System.out.println("새로 발급된 토큰이 없음 또는 잘못된 토큰 형식");
	                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	                    response.getWriter().print("새로 발급된 토큰이 없음 또는 잘못된 토큰 형식");
	                    return;
	                }
	            } catch (ExpiredJwtException ex) {
	                System.out.println("리프레시 토큰도 만료됨");
	                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	                response.getWriter().print("refresh token expired");
	                return;
	            } catch (Exception ex) {
	                System.out.println("토큰 갱신 중 오류 발생: " + ex.getMessage());
	                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	                response.getWriter().print("토큰 갱신 중 오류 발생");
	                return;
	            }
	        }
	        
	        

	        System.out.println("-------------------------------");
	        // 토큰에서 category 확인 (access 토큰인지 확인)
	        String category = jwtUtil.getCategory(token);
	        if (!"access".equals(category)) {
	            System.out.println("유효하지 않은 access 토큰");
	            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	            response.getWriter().print("invalid access token");
	            return;
	        }

	       // System.out.println("2222222222222222222222222222222222222");
	      //  System.out.println("888888888888888888888888");
		// 토큰에서 username과 role 획득
		String email = jwtUtil.getUserEmail(token);
	
		String role = jwtUtil.getRole(token);
		
		Long user_id = jwtUtil.getUserId(token);
	
		String name = jwtUtil.getName(token);

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
        if (isOAuth2User(token)&& request.getRequestURI().equals("/gohome")) {
        	//System.out.println("오스로그인으로옴");
        
            // OAuth2 토큰 처리
            CustomOAuth2User customOAuth2User = new CustomOAuth2User(userVo);
            Authentication authToken = new UsernamePasswordAuthenticationToken(customOAuth2User, null, customOAuth2User.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authToken);
            
            // 단순히 성공 응답만 반환
            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json");
            response.getWriter().print("{\"message\": \"OAuth2 login successful\"}");
            
            return;
        } else {
        //	System.out.println("444444444444444444444444444444");
            // 일반 로그인 토큰 처리
            CustomUserDetails customUserDetails = (CustomUserDetails) customUserDetailsService.loadUserByUsername(email);
            Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authToken);
         //   System.out.println("23333333333333333333333");
        }
		

		filterChain.doFilter(request, response);
	}
	 private boolean isOAuth2User(String token) {
	        // OAuth2 토큰 여부를 확인하는 로직 (예: 토큰의 특정 클레임을 확인)
	        return jwtUtil.getCategory(token).equals("access");
	    }
}