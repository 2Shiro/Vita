package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketVo {
	
	private int basket_id;
	private int id;
	private int pro_id;
	private int count;
	private int state;
	private int price;
	private int delivery_charge;
	
}
