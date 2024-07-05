package com.vita.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RefundVo {
	private int refund_id;
	private int pay_id;
	private int count;
	private String reason;
	private String created;
	private int state;
}
