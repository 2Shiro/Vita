package com.vita.compare.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.compare.domain.CompareNutrientDto;
import com.vita.compare.domain.CompareProductDto;
import com.vita.compare.mapper.CompareMapper;
import com.vita.domain.AllProductsDto;

@Service
public class CompareService {
	
	@Autowired
	private CompareMapper compareMapper;

	public List<AllProductsDto> findWishItems(Long id) {
		
		List<AllProductsDto> items = compareMapper.findIWishtems(id);
		
		return items;
	}

	public List<AllProductsDto> findBasketItems(Long id) {
		List<AllProductsDto> items = compareMapper.findBasketItems(id);
		return items;
	}

	  public List<CompareProductDto> findCompareProducts(Map<String, Object> compareRequest) {
	        Long productId1 = Long.valueOf(compareRequest.get("productId1").toString());
	        Long productId2 = Long.valueOf(compareRequest.get("productId2").toString());

	        List<CompareProductDto> products = compareMapper.findCompareProducts(productId1, productId2);
	      

	        for (CompareProductDto product : products) {
	            // Split caution and functional fields into arrays
	            if (product.getCaution() != null) {
	                product.setCautionList(product.getCaution().split(","));
	            }
	            if (product.getFunctional() != null) {
	                product.setFunctionalList(product.getFunctional().split(","));
	            }
	        }
	        // 두 제품의 성분 비교 및 정렬
	      
	       return products;
	  
	    }

	public List<CompareNutrientDto> findCompareNutrients(Map<String, Object> compareRequest) {
		  Long productId1 = Long.valueOf(compareRequest.get("productId1").toString());
	      Long productId2 = Long.valueOf(compareRequest.get("productId2").toString());
	       
		  List<CompareNutrientDto> nutrients = compareMapper.findCompareNutrients(productId1, productId2);
		return nutrients;
	}
	
	

}
