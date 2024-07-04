package com.vita.compare.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompareProductDto {
	
	private Long pro_id;
	private String name;
	private String make_name;
	private String explain; //상품설명
	private int price;
	private String img;
	private int total_sell;

	private int total;
	private String caution;
	private String take;
	private String expiration;
	private String form;
	private String functional;
	private String includnu;
	
	private String[] cautionList;
	private String[] functionalList;
	private List<CompareNutrientDto> nutrients; // 성분 정보를 포함하는 리스트

}

