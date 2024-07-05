package com.vita.compare.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.compare.domain.CompareNutrientDto;
import com.vita.compare.domain.CompareProductDto;
import com.vita.compare.service.CompareService;
import com.vita.controller.GetUserIdService;


import jakarta.servlet.http.HttpServletRequest;

@RestController
public class CompareApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private CompareService compareService; 
	
	@PostMapping("/Compare/Api/Go")
	public ResponseEntity<Map<String, Object>> CompareGO(HttpServletRequest request, @RequestBody Map<String, Object> compareRequest){
		  Long productId1 = Long.valueOf(compareRequest.get("productId1").toString());
	      Long productId2 = Long.valueOf(compareRequest.get("productId2").toString());
	      
	    
	      Long id = getUserIdService.getId(request);
	      
	      
	      List<CompareProductDto> products = compareService.findCompareProducts(compareRequest);
	      List<CompareNutrientDto> nutrients = compareService.findCompareNutrients(compareRequest);
	     
	     
	      
	      Map<String, Object> response = new HashMap<>();
	      response.put("products", products);
	      response.put("nutrients", nutrients);
	        
	      return ResponseEntity.ok(response);
	      
	      
		
	}
	

}
