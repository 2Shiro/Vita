package com.vita.oauth.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RefreshDTO {

	private Long tocken_id;
	private String username; // 하나의 유저가 여러개의 토큰
	private String refresh;
	private String expiration;
	private Long id;
	private boolean isValid;
}
