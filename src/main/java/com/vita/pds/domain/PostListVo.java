package com.vita.pds.domain;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostListVo {

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
    private boolean read;
    private boolean bookmark_count;

    private String content_str;
    private String[] content_mark;

    public void splitContent() {
        // 해시태그만 추출
        if (content.contains("#")) {
            String[] parts = content.split("#");
            ArrayList<String> marks = new ArrayList<>();
            for (int i = 1; i < parts.length; i++) { // 첫 번째 부분은 해시태그가 아닌 앞의 내용이므로 건너뜁니다.
                String mark = parts[i].split("\\s+|,|\\.|!|\\?")[0].trim();
                marks.add(mark);
            }
            this.content_mark = marks.toArray(new String[0]);
        }

        // img 태그가 포함된 부분 제거
        String contentWithoutImg = content.replaceAll("<img[^>]*>", "");

        // 첫 번째 p 태그 내용 추출
        Matcher matcher = Pattern.compile("<p[^>]*>(.*?)</p>").matcher(contentWithoutImg);
        while (matcher.find()) {
            String pContent = matcher.group(1).replaceAll("<br\\s*/?>", "").trim();
            if (!pContent.isEmpty()) {
                this.content_str = pContent;
                break;
            }
        }

        // 특수 문자 제거
        if (this.content_str != null) {
            this.content_str = this.content_str.replaceAll("[^a-zA-Z0-9가-힣\\s]", "");
        }

        // 내용이 없을 경우 기본값 설정
        if (this.content_str == null) {
            this.content_str = "";
        }

        this.content = null; // content 초기화
    }
}
