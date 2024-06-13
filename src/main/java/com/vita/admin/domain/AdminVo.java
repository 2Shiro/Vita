package com.vita.admin.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminVo {

	private int admin_id;
	private String name;
	private String id;
	private String password;
}