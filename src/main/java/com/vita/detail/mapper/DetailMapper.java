package com.vita.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.detail.domain.BasketVo;
import com.vita.detail.domain.FaqVo;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
@Mapper
public interface DetailMapper {
	
	ProductVo getProductDetail(int pro_id);

	List<ReviewVo> getReviewList(int pro_id);

	List<FaqVo> getFaqList();

	int getReviewCount(int pro_id);

	int star1(int pro_id);
	int star2(int pro_id);
	int star3(int pro_id);
	int star4(int pro_id);
	int star5(int pro_id);

	Double getAvgStar(int pro_id);
	
	List<ReviewVo> getReviewList(@Param("pro_id") int pro_id, @Param("offset") int offset,
								@Param("pageSize") int pageSize);

	int one(int pro_id);
	int two(int pro_id);
	int three(int pro_id);
	int four(int pro_id);
	int five(int pro_id);
	
	void incart(int pro_id);

	void cart(BasketVo basketVo);

	void cart2(int pro_id, int count);

	
}
