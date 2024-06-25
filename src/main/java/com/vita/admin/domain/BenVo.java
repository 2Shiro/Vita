package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BenVo {
	private int ben_id;
	private int id;
	private String reason;
	private String created;
	private String dismiss;
	private String email;
}