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
public class PostVo {

  
  private Long post_id;
  private Long id;
  private Long ptype_id;
  private String title;
  private String content;
  private int state;
  private LocalDate	created;
  

}
