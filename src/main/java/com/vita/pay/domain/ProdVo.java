package com.vita.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProdVo {
	
	private int pro_id;
	private String name;
	private int make_id;
	private int ing_id;
	private String url;
	private int form_id;
	private String explain;
	private String caution;
	private int price;
	
}
