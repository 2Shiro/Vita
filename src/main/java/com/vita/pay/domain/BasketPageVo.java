package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketPageVo {
	
	private int basket_id;
	private int pro_id;
	private int img_id;
	private int make_id;
	
	private String img;
	private String url;
	private String pname;
	private String mname;
	private int price;
	private int count;
	private int delivery_charge;
	private int state;
	
}
