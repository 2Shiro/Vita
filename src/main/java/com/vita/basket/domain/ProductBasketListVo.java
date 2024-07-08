package com.vita.basket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductBasketListVo {
	
	private Long pro_id;//상품번호
	private String name;
	private Long ing_id; //상품비교를위한 대표 성분번호
	private int price;
	private String img;
	Double average_rating;
	String string_price;
	
	String string_average_arting;
	
	
	
}
