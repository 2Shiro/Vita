package com.vita.pds.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentsVo {
	private Long comme_id;
	private Long id;
	private Long post_id;
	private String content;
	private LocalDate created;
	
	
	
}
