package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVo {
	private int post_id;
	private int id;
	private int ptype_id;
	private String title;
	private String content;
	private int state;
	private String created;
	private String email;
}
