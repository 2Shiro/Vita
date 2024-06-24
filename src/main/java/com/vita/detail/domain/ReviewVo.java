package com.vita.detail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
	
	private int rev_id;
	private int id;
	private int pro_id;
	private String content;
	private String created;
	private String rating;
	private String img;
	
	// 좋아요
	private int thumb;
	private int rlike;
	
	// 이메일에서 앞5개 제외 뒤에 *처리
	private String nick;	
	
	// 별 평균
	private Double avgstar;
	
	// 리뷰 개수
	private int review_count;
	
	// 막대바 확률
	private int ratio;

}
