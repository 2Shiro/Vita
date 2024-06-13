package com.vita.pay.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.oauth.domain.CustomOAuth2User;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.pay.domain.BasketPageVo;
import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
import com.vita.pay.domain.ProdVo;
import com.vita.pay.mapper.PayMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PayController {
	 
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private PayMapper payMapper;
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@GetMapping("/Pay/Basket")
	public ModelAndView basket(HttpServletRequest request) {

	   
	    Long userId = getUserIdService.getId(request);
	    
	    ModelAndView mv = new ModelAndView();
	    // 장바구니 목록 가져오기
	    List<BasketPageVo> basketPageList = new ArrayList<>();
	    List<BasketVo> basketList = payMapper.getBasketList(userId);
	    
	    for (BasketVo basketvo : basketList) {
	        
	        ProdVo prodvo = payMapper.getProd(basketvo.getPro_id());
	        
	        ImgsVo imgsvo = payMapper.getImg(basketvo.getPro_id());
	        
	        MakeVo makevo = payMapper.getMake(prodvo.getMake_id());
	        
	        BasketPageVo basketpagevo = new BasketPageVo(
	            basketvo.getBasket_id(), 
	            basketvo.getPro_id(), 
	            imgsvo.getImg_id(), 
	            prodvo.getMake_id(),
	            imgsvo.getImg(), 
	            prodvo.getName(), 
	            makevo.getName(),
	            basketvo.getPrice(), 
	            basketvo.getCount(), 
	            basketvo.getDelivery_charge(), 
	            basketvo.getState()
	        );
	        
	        basketPageList.add(basketpagevo);
	    }
	    
	    mv.addObject("basketList", basketList);
	    mv.addObject("basketPageList", basketPageList);
	    mv.setViewName("pay/basket");
	    
	    return mv;
	}

	
	@RequestMapping("/Pay/PayForm")
	public String payform() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomOAuth2User customOAuth2User = (CustomOAuth2User) authentication.getPrincipal();
		Long userId = customOAuth2User.getUserId();
		
		System.out.println("user_id: " + userId);
		
		return "pay/pay";
	}
	
	@RequestMapping("/Pay/Success")
	public String success() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomOAuth2User customOAuth2User = (CustomOAuth2User) authentication.getPrincipal();
		Long userId = customOAuth2User.getUserId();
		
		System.out.println("user_id: " + userId);
		
		return "pay/success";
	}

}
