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
        if (this.content != null) {
            System.out.println("Original content: " + this.content);
            ArrayList<String> marks = new ArrayList<>();
            
            // 해시태그 추출 패턴
            Pattern pattern = Pattern.compile(",\\s*(#\\S+\\s*)+");
            Matcher matcher = pattern.matcher(this.content);
            
            if (matcher.find()) {
                String hashtags = matcher.group(0);
                System.out.println("Hashtags: " + hashtags);
                
                // 해시태그를 분리하여 marks에 저장
                Pattern hashPattern = Pattern.compile("#(\\S+)");
                Matcher hashMatcher = hashPattern.matcher(hashtags);
                
                while (hashMatcher.find()) {
                    String mark = hashMatcher.group(1);
                    marks.add(mark);
                    System.out.println("Found hashtag: " + mark);
                }
                
                // 해시태그를 content에서 제거
                this.content = matcher.replaceAll("").trim();
                this.content_str = this.content; // 제거된 내용을 content_str에 저장
                this.content_mark = marks.toArray(new String[0]); // 해시태그 배열에 저장
                
                System.out.println("Processed content: " + this.content);
                System.out.println("Content marks: " + String.join(", ", this.content_mark));
            } else {
                System.out.println("No hashtags found");
                this.content_str = this.content; // 해시태그가 없을 경우 그대로 저장
            }
        } else {
            System.out.println("Content is null");
        }
    }
}

