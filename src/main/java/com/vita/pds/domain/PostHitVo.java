package com.vita.pds.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostHitVo {

	private Long hit_id;
	private Long id;
	private Long post_id;
	private int read;
	private String title;
	 
}
