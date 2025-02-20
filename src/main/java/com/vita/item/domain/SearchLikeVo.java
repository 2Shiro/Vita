package com.vita.item.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchLikeVo {
	
	String category;
	String ingredient;
	String price;
	String searchIcon;
	
	Integer intprice;
	
	Long id;
			

}
