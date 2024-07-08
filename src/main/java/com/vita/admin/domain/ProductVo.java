package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVo {
	private int pro_id;
	private String name;
	private int ing_id;
	private int make_id;
	private String url;
	private int form_id;
	private String explain;
	private String caution;
	private int price;
	
	private int count;
	private String make_name;
	private String ing_name;
	private String type;
	private String admin_name;
}
