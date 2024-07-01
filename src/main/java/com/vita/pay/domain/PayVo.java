package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayVo {
	
	private int pay_id;
	private int id;
	private String identity;
	private int sum;
	private String way;
	private String req;
	private int address_id;
	private String created;
	
}
