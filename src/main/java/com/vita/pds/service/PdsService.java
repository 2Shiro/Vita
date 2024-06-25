package com.vita.pds.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostListVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.domain.PostVo;


public interface PdsService {
	
	  void savePost(HashMap<String, Object> map);
	  
	  PostViewVo findPost(Long post_id);

	  List<CommentsVo> findPageingComments(HashMap<String, Object> params);
	
	  int findAllPost();

	  List<PostListVo> PostList(HashMap<String, Object> params);
	
	  void saveComment(CommentsVo commentsVo);

	  int addLike(Map<String, Long> params);

	 boolean existsLike(Map<String, Long> params);

	boolean existsPostLike(Map<String, Long> params);

	int postAddLike(Map<String, Long> params);

}
