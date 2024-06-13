package com.vita.oauth.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {

	private Long id;   
	private String email;
	private String name;
	private String password;
	private String sex;
	private String BIRTH;
	private String role;
	private String oauth_provider;
	private String oauth_email;
	
	private String oauth;
	
}
