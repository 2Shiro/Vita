package com.vita.pds.mapper;
import java.util.HashMap;
import java.util.List;

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

	

	

}
