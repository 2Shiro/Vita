package com.vita.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayResultVo {
	
	private int goods_id;
	private int pro_id;
	private String identity;
	private int img_id;
	private String img;
	private String url;
	private String name;
	private int price;
	private int count;
	private int state;
	
}
