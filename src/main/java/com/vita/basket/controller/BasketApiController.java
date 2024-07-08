package com.vita.basket.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.basket.domain.ModalBasketVo;
import com.vita.basket.domain.ProductBasketListVo;
import com.vita.basket.domain.ProductBasketVo;
import com.vita.basket.service.BasketModalService;
import com.vita.controller.GetUserIdService;
import com.vita.domain.AllProductsDto;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class BasketApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private BasketModalService basketModalService;

	@PostMapping("/Basket/Api/add")
	public ResponseEntity<Map<String, Object>> BasketModalAdd(HttpServletRequest request,@RequestBody Map<String, Object> payload ){
		System.out.println("여기까지 오나 ?");
		Long proId = Long.parseLong(payload.get("pro_id").toString());
		 System.out.println("proId" + proId);
	    int count = Integer.parseInt(payload.get("count").toString());
	    System.out.println("count" + count);
	    int price = Integer.parseInt(payload.get("price").toString()); 
	    System.out.println("price" + price);
	    
	    ModalBasketVo modalBasketVo = new ModalBasketVo();
	    modalBasketVo.setPro_id(proId);
	    modalBasketVo.setCount(count);
	    modalBasketVo.setPrice(price);
		//보내야하는거
		//private Long id;유저아이디 이건 requset로 받음 밑에3개만 보내면됨
		//private Long pro_id;상품아이디
		//private int count;갯수
		//private int price;상품하나의 가격
		if(modalBasketVo.getCount() > 1) {
			//상품이 2개이상 들어올때
			 price = modalBasketVo.getPrice();
			 count = modalBasketVo.getCount();
			modalBasketVo.setPrice(price * count);
		}
		Long id = getUserIdService.getId(request);
	    modalBasketVo.setId(id);
		
	    //장바구니 전체의 가격
	    ProductBasketVo basketVo = basketModalService.saveBasket(modalBasketVo);
		
	    System.out.println("장바구니까는 되었나?");
	    //함께 많이 주문하는 상품
	    List<ProductBasketListVo> combineList = basketModalService.findCombineList(basketVo);
	    System.out.println("combineList는 되었나?");
	    //다른사람들이 함께본 상품
	    List<ProductBasketListVo> similarList = basketModalService.findSimilarList(basketVo);
	    System.out.println("similarList는 되었나?");
	    System.out.println(basketVo);
		
	    for (ProductBasketListVo productBasketListVo : combineList) {
	    	NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
	    	productBasketListVo.setString_price(numberFormat.format(productBasketListVo.getPrice()));
		}
	    
	    for (ProductBasketListVo productBasketListVo : similarList) {
	    	NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
	    	productBasketListVo.setString_price(numberFormat.format(productBasketListVo.getPrice()));
		}
		//로직
		//1.장바구니 저장
		//2.상품정보 db 가져오기(상품 + 성분요소) ing로 가져오기
		//3.상품정보를 바탕으로 (함께많이 주문하는 상품, 다른고객이 함께본 상품)2개 가져오기
		//respone에 상품정보,함께많이 주문하는 상품, 다른고객이 함께본 상품 3가지를 보내기 
		
		//1.장바구니 저장
		
		
		Map<String, Object> response = new HashMap<>();
		response.put("basketVo", basketVo);
		response.put("combineList", combineList);
		response.put("similarList", similarList);
		
		return ResponseEntity.ok(response);
	}
}
