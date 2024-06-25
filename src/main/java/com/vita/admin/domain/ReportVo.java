package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportVo {
	private int report_id;
	private int post_id;
	private int id;
	private String reason;
	private String created;
	private String email;
	private String title;
}
