package com.vita.pay.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.pay.domain.BasketPageVo;
import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.DeliveryVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
import com.vita.pay.domain.ProdVo;
import com.vita.pay.mapper.PayMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Pay")
public class PayController {
	 
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private PayMapper payMapper;
	
	// 장바구니 화면 출력
	@GetMapping("/Basket")
	public ModelAndView basket(HttpServletRequest request) {

	   
	    Long id = getUserIdService.getId(request);
	    
	    ModelAndView mv = new ModelAndView();
	    // 장바구니 목록 가져오기
	    List<BasketPageVo> basketPageList = new ArrayList<>();
	    List<BasketVo> basketList = payMapper.getBasketList(id);
	    
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
	            prodvo.getUrl(),
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
	
	@RequestMapping("/PayForm")
	public ModelAndView payform(HttpServletRequest request) {

	    Long id = getUserIdService.getId(request);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    // 장바구니 목록 가져오기
	    List<BasketPageVo> payPageList = new ArrayList<>();
	    List<BasketVo> payList = payMapper.getPayList(id);
	    
	    for (BasketVo basketvo : payList) {
	        
	        ProdVo prodvo = payMapper.getProd(basketvo.getPro_id());
	        
	        ImgsVo imgsvo = payMapper.getImg(basketvo.getPro_id());
	        
	        MakeVo makevo = payMapper.getMake(prodvo.getMake_id());
	        
	        BasketPageVo basketpagevo = new BasketPageVo(
	            basketvo.getBasket_id(),
	            basketvo.getPro_id(),
	            imgsvo.getImg_id(),
	            prodvo.getMake_id(),
	            imgsvo.getImg(),
	            prodvo.getUrl(),
	            prodvo.getName(),
	            makevo.getName(),
	            basketvo.getPrice(),
	            basketvo.getCount(),
	            basketvo.getDelivery_charge(),
	            basketvo.getState()
	        );
	        
	        payPageList.add(basketpagevo);
	    }
	    
	    // 기본 배송지 가져오기
	    DeliveryVo deliveryvo = payMapper.getDeliveryDefualt(id);
	    
	    // 배송지 목록 가져오기
	    List<DeliveryVo> deliveryList = payMapper.getDeliveryList(id);
	    
	    mv.addObject("payList", payList);
	    mv.addObject("payPageList", payPageList);
	    mv.addObject("deliveryvo", deliveryvo);
	    mv.addObject("deliveryList", deliveryList);
	    mv.addObject("id", id);
	    mv.setViewName("pay/pay");
	    
	    return mv;
	}
	
	@RequestMapping("/Success")
	public String success(HttpServletRequest request) {
		
		Long userId = getUserIdService.getId(request);
		
		return "pay/success";
	}

}

