package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquiryVo {
	private int inquiry_id;
	private int id;
	private String title;
	private String content;
	private String name;
	private String created;
}
