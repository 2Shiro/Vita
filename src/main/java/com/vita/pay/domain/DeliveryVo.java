package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryVo {
	
	private int address_id;
	private int id;
	private String name;
	private String recipent;
	private String tel;
	private int zipcode;
	private String address;
	private String addressdetail;
	private String req;
	private int defualt;
	
}
