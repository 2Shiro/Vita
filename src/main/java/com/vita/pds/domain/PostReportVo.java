package com.vita.pds.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostReportVo {
	Long report_id;
	Long post_id;
	Long id;
	String reason;
	LocalDate create;
	
	
	

}
