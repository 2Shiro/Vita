package com.vita.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.pay.domain.BasketPageVo;
import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
import com.vita.pay.domain.ProdVo;
import com.vita.pay.mapper.PayMapper;
import com.vita.pay.service.BasketService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PayController {
	 
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private PayMapper payMapper;
	
	@Autowired
    private BasketService basketService;
	
	// 장바구니 화면 출력
	@GetMapping("/Pay/Basket")
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
	
	@PostMapping("/Pay/UpdateCount")
	public Map<String, Object> updateCount(@RequestBody Map<String, Object> params, HttpServletRequest request) {
	    Long id = getUserIdService.getId(request);
	    
	    Long basket_id = Long.parseLong(params.get("basket_id").toString());
	    int count = Integer.parseInt(params.get("count").toString());

	    Map<String, Object> response = new HashMap<>();

	    try {
	        // 장바구니 아이템 수량 업데이트
	        basketService.updateItemCount(basket_id, count);

	        // 새로운 가격 정보 계산
	        int prodPrice = basketService.calculateItemPrice(basket_id, count);
	        int totalPrice = basketService.calculateTotalPrice(id);

	        // 응답 데이터 생성
	        response.put("status", "success");
	        response.put("prodPrice", prodPrice);
	        response.put("totalPrice", totalPrice);
	    } catch (BasketService.ItemNotFoundException e) {
	        response.put("status", "error");
	        response.put("message", e.getMessage());
	    } catch (Exception e) {
	        response.put("status", "error");
	        response.put("message", "예상치 못한 오류가 발생했습니다.");
	    }

	    return response;
	}

	
	@RequestMapping("/Pay/PayForm")
	public String payform(HttpServletRequest request) {

		 Long userId = getUserIdService.getId(request);
		
		return "pay/pay";
	}
	
	@RequestMapping("/Pay/Success")
	public String success(HttpServletRequest request) {
		
		Long userId = getUserIdService.getId(request);
		
		return "pay/success";
	}

}
