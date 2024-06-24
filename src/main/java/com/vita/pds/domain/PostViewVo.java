package com.vita.pds.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostViewVo {
	private Long post_id;
	private Long id;
	private String name;
	private int ptype_id;
	private String title;
	private String content;
	private int state;
	private LocalDate created;
	private int hit_count;
	private int like_count;
	private int comment_count;
	
}
