package com.vita.detail.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.detail.domain.FaqVo;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
@Mapper
public interface DetailMapper {
	
	ProductVo getProductDetail(int pro_id);

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
	
	
	// 장바구니
	int incart(HashMap<String, Object> map);

	int getProductStock(HashMap<String, Object> map);

	void cart(HashMap<String, Object> map);

	int getCurrentBasketCount(HashMap<String, Object> map);

	void cart2(HashMap<String, Object> map);
	
	int getPrice(HashMap<String, Object> map);
	
	void delivery(HashMap<String, Object> map);
	
	List<ProductVo> getProdList(int pro_id);
	
	// 위시리스트
	int getWish(HashMap<String, Object> map);

	void addWishlist(HashMap<String, Object> map);

	void deleteWishlist(HashMap<String, Object> map);
	
	// 바로 구매
	void buy(HashMap<String, Object> map);
	
	// 좋아요
//	int getLikeStatus(Map<String, Integer> params);
//
//	void removeLike(Map<String, Integer> params);
//
//	void addLike(Map<String, Integer> params);
//
//	int countLikes(int rev_id);

	
}
