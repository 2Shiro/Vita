package com.vita.pds.domain;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	
	
	private String content_str;
	private String[] content_mark;
	
	 public void removeHash() {
	        ArrayList<String> marks = new ArrayList<>();
	        Pattern pattern = Pattern.compile("#(\\S+)");
	        Matcher matcher = pattern.matcher(this.content);

	        while (matcher.find()) {
	            marks.add(matcher.group(1)); // 해시태그 저장
	        }

	        this.content = matcher.replaceAll("").trim(); // 해시태그 제거한 내용
	        this.content_str = this.content; // 제거된 내용을 content_str에 저장
	        this.content_mark = marks.toArray(new String[0]); // 해시태그 배열에 저장
	    }
}
