package com.vita.item.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.controller.GetUserIdService;
import com.vita.domain.AllProductsDto;
import com.vita.domain.HomeNutrientsDto;
import com.vita.item.domain.SearchLikeVo;
import com.vita.item.mapper.ItemMapper;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class ItemApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	@Autowired
	private ItemMapper itemMapper;
	
	@PostMapping("/Item/Popularity")
	public ResponseEntity<Map<String, Object>> handlePopularity(@RequestBody SearchLikeVo searchLikeVo, HttpServletRequest request) {
		
		System.out.println("비동기처리로 오나?");
        // searchLikeVo 객체를 사용한 비즈니스 로직 처리
		Long id = getUserIdService.getId(request);
		searchLikeVo.setId(id);
        System.out.println("처음온 serach 값:" +searchLikeVo);
        if (searchLikeVo.getCategory().equals("전체")) {
        	searchLikeVo.setCategory(null);
	    }
		if (searchLikeVo.getIngredient().equals("전체")) {
			searchLikeVo.setIngredient(null);
	    }
		if (searchLikeVo.getPrice().equals("전체")) {
			
			searchLikeVo.setIntprice(100000);
	    }else if(searchLikeVo.getPrice() != null){
	    	searchLikeVo.setIntprice(Integer.parseInt( searchLikeVo.getPrice()));
	    }
		if (searchLikeVo.getSearchIcon().equals("전체")) {
			searchLikeVo.setSearchIcon(null);
	    }
		System.out.println("초기화한 serach 값:" +searchLikeVo);
		
		List<AllProductsDto> productsDto = null;
		if(searchLikeVo.getCategory() != null) {
			if (searchLikeVo.getCategory().equals("인기순")) {
				 productsDto = itemMapper.findLikeGoodProducts(searchLikeVo);
				
			}else if (searchLikeVo.getCategory().equals("가격순")) {
				productsDto = itemMapper.findPriceProducts(searchLikeVo);
			}else {
				productsDto = itemMapper.findLikeProducts(searchLikeVo); //전체순
			}
		}else {
			productsDto = itemMapper.findLikeProducts(searchLikeVo); //전체순
		}
		 
		
        List<HomeNutrientsDto> nutrientsDto = itemMapper.findLikenutrients();
        
        for (AllProductsDto product : productsDto) {
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
            
            // 가격 포맷팅
            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
            product.setString_price(numberFormat.format(product.getPrice()));
            
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

        for (AllProductsDto allProducts : productsDto) {
            System.out.println(allProducts);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("products", productsDto);
        response.put("totalProducts", productsDto.size());
        
        System.out.println("가지고옴");
        System.out.println("가지고옴");
        System.out.println(productsDto);
        // 적절한 응답 반환
        return ResponseEntity.ok(response);
    }

}
