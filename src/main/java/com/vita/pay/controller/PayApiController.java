package com.vita.pay.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.controller.GetUserIdService;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.pay.mapper.PayMapper;
import com.vita.pay.service.BasketService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class PayApiController {
	
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
    private BasketService basketService;
	
	@Autowired
    private PayMapper payMapper;
	
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
	
	
	
    @PostMapping("/Pay/UpdateState")
    public ResponseEntity<String> updateBasketState(@RequestBody Map<String, Object> payload) {
        
            Long basket_id = Long.valueOf(payload.get("basketId").toString());
            int state = Integer.parseInt(payload.get("state").toString());

            payMapper.updateState(basket_id, state);

            return ResponseEntity.ok("State updated successfully");
       
    }

}
