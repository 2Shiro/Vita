package com.vita.wishlist.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.controller.GetUserIdService;
import com.vita.wishlist.service.WishlistService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class WishlistApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private WishlistService wishlistService;

	@PostMapping("/Wishlist/add")
	public ResponseEntity<?> addWishlist(@RequestBody Map<String, Object> payload, HttpServletRequest request) {
        //String proId = (String) payload.get("pro_id");
        Long id = getUserIdService.getId(request);
        
        
        payload.put("id", id);
        System.out.println(payload);
        System.out.println(payload);
        System.out.println(payload);
        try {
            wishlistService.save(payload);
            return ResponseEntity.ok(Collections.singletonMap("status", "success"));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body(Collections.singletonMap("status", "error"));
        }
	}
	  @PostMapping("/Wishlist/delete")
	    public ResponseEntity<?> deleteWishlist(@RequestBody Map<String, Object> payload, HttpServletRequest request) {
		   // String proId = (String) payload.get("pro_id");
	        Long id = getUserIdService.getId(request);
	        payload.put("id", id);

	        try {
	            wishlistService.delete(payload);
	            return ResponseEntity.ok(Collections.singletonMap("status", "success"));
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body(Collections.singletonMap("status", "error"));
	        }
	    }
	
}