package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MakeVo {
	
	private int make_id;
	private String name;
	private String tel;
	private int zipcode;
	private String address;
	private String addressdetail;
	
}
