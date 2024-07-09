package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CReportVo {
	private int creport_id;
	private int comme_id;
	private int id;
	private String reason;
	private String created;
	private String email;
	private String content;
}
