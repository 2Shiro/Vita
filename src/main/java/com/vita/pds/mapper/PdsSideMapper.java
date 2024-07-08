package com.vita.pds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.pds.domain.PostHitVo;
import com.vita.pds.domain.PostRecommendVo;



@Mapper
public interface PdsSideMapper {

	List<PostRecommendVo> findRecommendPost();

	List<PostRecommendVo> findbasketPost(Long id);

	List<PostHitVo> findHitList(Long id);


	

	

}
