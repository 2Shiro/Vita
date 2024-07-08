package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockVo {
	
	private int stock_id;
	private int pro_id;
	private int admin_id;
	private int count;
	private int state;
	private String additional;
	
}
