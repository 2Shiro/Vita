package com.vita.detail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqVo {
	
	private int faq_id;
	private String question;
	private String answer;

}
