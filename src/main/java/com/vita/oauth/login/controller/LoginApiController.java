package com.vita.oauth.login.controller;

import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class LoginApiController {
	//로그인버튼클릭
	@PostMapping("/ffdd")
    public String loginB() {
	    
        return "스쳐지나감";
    }
	
	 @GetMapping("/fsdfsdf/fsd")
	    public ResponseEntity<String> headerToken(@RequestHeader("Authorization") String authorizationHeader) {
		   System.out.println("headerToken 패치 진행중");
		   System.out.println(authorizationHeader);
		   System.out.println("headerToken 패치 진행중");
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        HttpHeaders headers = new HttpHeaders();
	        
	        // 'Authorization' 헤더에서 토큰 추출
	        String accessToken = null;
	        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
	            accessToken = authorizationHeader.substring(7); // 토큰 부분 추출
	        }
	        
	        // 토큰을 다시 'Authorization' 헤더에 추가
	        headers.add("Authorization", "Bearer " + accessToken);
	        
	        if (authentication.isAuthenticated()) {
	            return ResponseEntity.ok()
	                                 .headers(headers)
	                                 .body("Success"); // 성공적인 응답 본문
	        } else {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
	                                 .headers(headers)
	                                 .body("Unauthorized"); // 권한 없는 응답 본문
	        }
	    }
	 


}
