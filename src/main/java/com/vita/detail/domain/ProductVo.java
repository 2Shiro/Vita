package com.vita.detail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVo {
	
	private int pro_id;
	private String name;
	private String img;
	private int ing_id;
	private String url;
	private int form_id;
	private String explain;
	private String caution;
	private int stock_count; // 총 재고량
	private int stock;       // 구매하는 수량
	private int pro_price;	 // 제품의 가격
	private int price; 		 // 장바구니로 넘길 총 금액
	
	// 포함된 성분들과 함량
	private String ingredients;
	
	// 제형
	private String form_type;
	
	// 성분 함량
	private String capacity;
	
	// 브랜드
	private String brand_name;
	
	// 재고
	private int count;

}