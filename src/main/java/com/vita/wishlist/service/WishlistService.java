package com.vita.wishlist.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.wishlist.mapper.WishlistMapper;

@Service
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	public void save(Map<String, Object> payload) {
		wishlistMapper.save(payload);
		
	}
	public void delete(Map<String, Object> payload) {
		wishlistMapper.delete(payload);
		
	}

	
}
