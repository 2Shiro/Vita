package com.vita.detail.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
@Mapper
public interface DetailMapper {
	
	ProductVo getProductDetail(int pro_id);

	int getReviewCount(int pro_id);

	int star1(int pro_id);
	int star2(int pro_id);
	int star3(int pro_id);
	int star4(int pro_id);
	int star5(int pro_id);

	Double getAvgStar(int pro_id);

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
	
	// 리뷰 추천
	int status(HashMap<String, Object> map);

	int thumb(int rev_id);

	void addThumb(HashMap<String, Object> map);

	void removeThumb(HashMap<String, Object> map);
	
	// 리뷰 신고
	void notify(HashMap<String, Object> map);
	
	// 상품 질문
	void qnaSubmit(HashMap<String, Object> map);

	List<ProductVo> getQnaList(int pro_id);

	List<ProductVo> withoutSecret(int pro_id);

	List<ProductVo> getSellerInfo(int pro_id);

	List<ProductVo> getItems();

	List<ProductVo> getpopList();

	void deleteQ(HashMap<String, Object> map);

	void modifyQ(HashMap<String, Object> map);

	List<ProductVo> getSearchList(String keyword, int pro_id);

	int countQna(int pro_id);

	List<ProductVo> getQnaListPaging(int offset, int pageSize, int pro_id);

	List<ProductVo> getQnaListPagingSearch(int offset, int pageSize, String keyword, int pro_id, Long id);

//	List<ProductVo> getQnaListPagingSearch(int offset, String keyword, int pageSize, int pro_id);
	
	// 리뷰페이지
	List<ReviewVo> getReviewList(int pro_id);

	List<ReviewVo> getSearchReviewList(int pro_id, String keyword);

	int countReviewList(List<ReviewVo> reviewList);

	List<ReviewVo> getReListPaging(int pro_id, int offset, int pageSize);

	List<ReviewVo> getReListPagingSearch(int pro_id, String keyword, int offset, int pageSize);

	int getSearchReviewCount(int pro_id, String keyword);

	ReviewVo getBestReview(int pro_id);

	List<ReviewVo> bestReviewList(int pro_id);

	List<ProductVo> getQnaList5(int pro_id);


	
}
