package com.vita.wishlist.mapper;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface WishlistMapper {

	void save(Map<String, Object> payload);

	void delete(Map<String, Object> payload);

	
	

	

}
