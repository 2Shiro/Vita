package com.vita.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vita.domain.AllProductsDto;
import com.vita.domain.HomeNutrientsDto;
import com.vita.mapper.HomeMapper;




@RestController
public class HomeApiController {
	@Autowired
	private HomeMapper homeMapper;

	@GetMapping("/home/allproducts")
	public ResponseEntity<List<AllProductsDto>> homeProducts() {
        System.out.println("homeProducts로 옴");
        List<AllProductsDto> productsDto = homeMapper.findProducts();
        List<HomeNutrientsDto> nutrientsDto = homeMapper.findReviews();

        // 각 제품에 nutrient 정보를 추가
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
                nutrients.add("비타민A");
            }
            product.setNutrient(nutrients.toArray(new String[0]));
            
            //총팔린거 저장
            if (product.getTotal_sell() != null) {
                product.setTotal_sell(Math.abs(product.getTotal_sell()));
            }
            
            //별점 계산 나누기 2한거
            if (product.getAverage_rating() == null) {
                product.setAverage_rating(0L);
                product.setString_average_arting("3.0");
            } else {
            	  double avgRating = product.getAverage_rating();
                  
                  product.setString_average_arting(String.format("%.2f", avgRating));
            }
        }

        for (AllProductsDto allProducts : productsDto) {
            System.out.println(allProducts);
        }
 
        return ResponseEntity.ok(productsDto);
    }
	
}
