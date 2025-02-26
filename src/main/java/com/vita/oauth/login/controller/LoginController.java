package com.vita.oauth.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;


import com.vita.login.service.SignUpService;
import com.vita.oauth.domain.SignUpDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	
	@Autowired
	private SignUpService signUpService;

	
	
	@GetMapping("/")
	public String gLogin() {
		System.out.println("홈으로옴");		
		return "home";
	}
	
	@GetMapping("/home")
	public String home() {
		System.out.println("이게 실행되나?");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        // 인증된 사용자인지 확인
        if (authentication.isAuthenticated()) {
            // 사용자가 인증되었다면 home.jsp 페이지를 반환
        	System.out.println("토큰이 인증된체 넘어감");
            return "home"; // home.jsp 파일이 있는 경로와 이름으로 수정 필요
        } else {
            // 사용자가 인증되지 않았다면 로그인 페이지 또는 다른 페이지로 리다이렉트
        	System.out.println("토큰이 인증안되고  넘어감");
            return "home"; // 로그인 페이지로 리다이렉트하거나 다른 경로로 수정 필요
        }
		
	}
	//로그인창
	@GetMapping("/login")
	public String loginA() {
		System.out.println("/login으로 옴 get");
		return "login/login";
	}
	
	
	//생성할꺼 회원가입 폼으로
	@GetMapping("/login/WriteForm")
	public String writeForm() {
		System.out.println("write폼 즉 회원가입창");
		
		return "login/writeForm";
	}
	
	//회원가입버튼
	@PostMapping("/login/write")
	public String write(SignUpDTO signUpDTO ) {
		System.out.println("--------------");
		System.out.println("--------------");
		System.out.println("--------------");
		System.out.println(signUpDTO);
		System.out.println(signUpDTO);
		System.out.println(signUpDTO);
		System.out.println(signUpDTO);
		signUpService.save(signUpDTO);
        return "redirect:/login";	
	}
	
	
	
	
	
	
//	밑에는 정리해야될거
	
	
	@GetMapping("/Mypage/View")
	public String GoMypage() {
		
	
		return "mypage/view";
		
	}
	
	
	
	
	@GetMapping("/token/addtoken")
    public String addtoken(@RequestHeader("access") String access,HttpServletResponse response) {
	  System.out.println("addtoken 까지는 오옴");
	  System.out.println(access);
	  response.setHeader("access",access);
        return access;
    }
	

}
