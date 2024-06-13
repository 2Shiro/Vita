package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NutrientVo {
	private int nut_id;
	private int pro_id;
	private int ing_id;
	private int capacity;
	private String pro_name;
	private String ing_name;
	
}
