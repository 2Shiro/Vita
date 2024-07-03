package com.vita.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GoodsVo {
	
	private int goods_id;
	private int id;
	private int pro_id;
	private int pay_id;
	private int count;
	private int price;
	private int state;
	
}
