package com.vita.basket.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModalBasketVo {
	private Long basket_id;
	private Long id;
	private Long pro_id;
	private int count;
	private int state;
	private int price;
	private int delivery_charge;

	
	
	
}
