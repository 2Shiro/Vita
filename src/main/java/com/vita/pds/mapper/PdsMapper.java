package com.vita.pds.mapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostListVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.domain.PostVo;


@Mapper
public interface PdsMapper {

	void SavePost(PostVo postVo);

	PostViewVo FindPostId(Long post_id);

	List<CommentsVo> FindComments(HashMap<String, Object> params);

	int FindListPost();

	List<PostListVo> FindAllPostList(HashMap<String, Object> params);

	void saveComment(CommentsVo commentsVo);

	void saveCommentLike(Map<String, Long> params);

	boolean existsLike(Map<String, Long> params);

	int countComment(Map<String, Long> params);

	boolean existsPostLike(Map<String, Long> params);

	void savePostLike(Map<String, Long> params);

	int countPostLike(Map<String, Long> params);

	

	

}
