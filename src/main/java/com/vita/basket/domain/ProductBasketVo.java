package com.vita.basket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductBasketVo {
	
	private Long pro_id;//상품번호
	private String name;
	private Long ing_id; //상품비교를위한 대표 성분번호
	private int price;
	private String img;
	private int total_price;//전체 장바구니 가격
	private int total_items;// 상품의 항목개수 
	private int total_count;//장바구니에 담긴 상품의 개수
	
	private int free_delivery = 100000;
	private int free_need_price;//무료배송까지 필요하 가격 자바에서 제어하기
	
	private String string_free_delivery;
	private String string_total_price; //자바에서 제어하기
	
	private boolean free;
	
	
	
}
