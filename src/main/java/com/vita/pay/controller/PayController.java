package com.vita.pay.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.oauth.domain.CustomOAuth2User;
import com.vita.oauth.jwt.JWTUtil;

@Controller
public class PayController {

    @PostMapping("/Pay/View")
    @ResponseBody
    public Map<String, Object> payView(@RequestBody Map<String, Object> payload, Model model) {
        System.out.println("/Pay/View 일로 옴 : ");

        Long requestUserId = Long.parseLong(payload.get("user_id").toString());
        String userName = payload.get("user_name").toString();

        System.out.println("requestUserId 값이 옴 : " + requestUserId);
        System.out.println("userName 값이 옴 : " + userName);

        model.addAttribute("requestUserId", requestUserId);
        model.addAttribute("userName", userName);

        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("redirectUrl", "/pay/view?user_id=" + requestUserId + "&user_name=" + userName);

        return response;
    }
    
    @GetMapping("/Pay/View")
    	public String PayView() {
    		System.out.println("payview옴");
    	return "pay/view";
    	}
    	
    
}