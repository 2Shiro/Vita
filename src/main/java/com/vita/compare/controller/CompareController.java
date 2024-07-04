package com.vita.compare.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.compare.service.CompareService;
import com.vita.controller.GetUserIdService;
import com.vita.domain.AllProductsDto;
import com.vita.domain.HomeNutrientsDto;
import com.vita.item.mapper.ItemMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CompareController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private CompareService compareService;
	
	@Autowired
	private ItemMapper itemMapper;
	
	
	@GetMapping("/Compare/View")
	public ModelAndView CompareView(HttpServletRequest request) {
		
		Long id = getUserIdService.getId(request);
		
		
		
		//위시리스트 테이블
		
		List<AllProductsDto> wishItems = compareService.findWishItems(id);
		
		
		//최근본 공고 쿠키
		List<AllProductsDto> basketItems = compareService.findBasketItems(id);
		//장바구니 테이블
		
		
		// nutrients 배열 생성
		
		List<HomeNutrientsDto> nutrientsDto = itemMapper.findLikenutrients();
		
		//-------------------------------------------------------------
		 for (AllProductsDto product : wishItems) {
	            List<String> nutrients = new ArrayList<>();
	            for (HomeNutrientsDto nutrient : nutrientsDto) {
	                if (product.getPro_id() == nutrient.getPro_id()) {
	                    nutrients.add(nutrient.getName());
	                }
	            }
	            // nutrient 리스트가 비어 있으면 기본값 "비타민A" 설정
	            if (nutrients.isEmpty()) {
	                nutrients.add("비타민A");
	          
	            }
	            product.setNutrient(nutrients.toArray(new String[0]));
	            
	            //총팔린거 저장
	            if (product.getTotal_sell() != null) {
	                product.setTotal_sell(Math.abs(product.getTotal_sell()));
	            }
	            
	            //별점 계산 나누기 2한거
	            if (product.getAverage_rating() == null) {
	            	System.out.println("다일로옴?");
	                product.setAverage_rating(0.0);
	                product.setString_average_arting("3.0");
	            } else {
	            	  double avgRating = product.getAverage_rating();
	            	 
	                  product.setString_average_arting(String.format("%.2f", avgRating));
	            }
	        }
		 
		 
		 
		 for (AllProductsDto product : basketItems) {
	            List<String> nutrients = new ArrayList<>();
	            for (HomeNutrientsDto nutrient : nutrientsDto) {
	                if (product.getPro_id() == nutrient.getPro_id()) {
	                    nutrients.add(nutrient.getName());
	                }
	            }
	            // nutrient 리스트가 비어 있으면 기본값 "비타민A" 설정
	            if (nutrients.isEmpty()) {
	                nutrients.add("비타민A");
	          
	            }
	            product.setNutrient(nutrients.toArray(new String[0]));
	            
	            //총팔린거 저장
	            if (product.getTotal_sell() != null) {
	                product.setTotal_sell(Math.abs(product.getTotal_sell()));
	            }
	            
	            //별점 계산 나누기 2한거
	            if (product.getAverage_rating() == null) {
	            	System.out.println("다일로옴?");
	                product.setAverage_rating(0.0);
	                product.setString_average_arting("3.0");
	            } else {
	            	  double avgRating = product.getAverage_rating();
	            	 
	                  product.setString_average_arting(String.format("%.2f", avgRating));
	            }
	        }
		
		
		//-------------------------------------------------------------
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("compare/view");
	
		mv.addObject("wishItems",wishItems);
		mv.addObject("basketItems",basketItems);
		
		
		return mv;
	}
	

}
