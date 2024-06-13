package com.vita.oauth.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUpDTO {

	private Long id;   
	private String email;
	private String name;
	private String password;
	private String sex;
	private String birth;
	private int zipcode;
	private String address;
	private String addressdetail;
	private String tel;
	
	
}
