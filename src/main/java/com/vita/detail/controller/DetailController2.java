//package com.vita.detail.controller;
//
//import java.util.Collections;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.vita.detail.domain.BasketVo;
//import com.vita.detail.domain.Pagination;
//import com.vita.detail.domain.PagingResponse;
//import com.vita.detail.domain.PagingVo;
//import com.vita.detail.domain.ProductVo;
//import com.vita.detail.domain.ReviewVo;
//import com.vita.detail.mapper.DetailMapper;
//import com.vita.oauth.jwt.JWTUtil;
//
//@Controller
//public class DetailController2 {
//	
//	 @Autowired
//	 private JWTUtil jwtUtil;
//	 @Autowired
//	 private DetailMapper detailMapper;
//	
//		@RequestMapping("/Detail")
//		public ModelAndView detail(@RequestParam(value = "pro_id") int pro_id,
//		                           @RequestParam(value = "nowpage") int nowpage,
//		                           @RequestParam(value = "rev_id",required = false) Integer rev_id,
// 		                           BasketVo basket) {
//		    ModelAndView mv = new ModelAndView();
//		    
//		    mv.addObject("pro_id", pro_id);
//		    mv.addObject("rev_id", rev_id);
//		    
//		    int id = 1;
//		    mv.addObject("id", id);
//		    
//		    // 1. 상세 정보 가져오기
//		    ProductVo prod = detailMapper.getProductDetail(pro_id);
//		    mv.addObject("prod", prod);
//		    System.out.println("상품정보 : " + prod);
//		    
//		    // 2. 리뷰 목록 가져오기 with Paging
//		    List<ReviewVo> reviewList = detailMapper.getReviewList(pro_id, 0, 5); // 임시로 넣어둔 예제
//		    mv.addObject("reviewList", reviewList);
//		    System.out.println("reviewList : " + reviewList);
//		    
//		    // 리뷰 총 개수
//		    int recount = detailMapper.getReviewCount(pro_id);
//		    mv.addObject("recount", recount);
//		    
//		    // 리뷰 ☆ 평균
//		    Double avgstar = detailMapper.getAvgStar(pro_id);
//		    mv.addObject("avgstar", avgstar);
//		    System.out.println("avgstar :" +avgstar);
//		    
//		    // 리뷰점수별 퍼센트
//		    int one = detailMapper.one(pro_id);
//		    int two = detailMapper.two(pro_id);
//		    int three = detailMapper.three(pro_id);
//		    int four = detailMapper.four(pro_id);
//		    int five = detailMapper.five(pro_id);
//		    mv.addObject("one", one);
//		    mv.addObject("two", two);
//		    mv.addObject("three", three);
//		    mv.addObject("four", four);
//		    mv.addObject("five", five);
//		    
//		    // 리뷰 평점별 인원수
//		    int star1 = detailMapper.star1(pro_id);
//		    int star2 = detailMapper.star2(pro_id);
//		    int star3 = detailMapper.star3(pro_id);
//		    int star4 = detailMapper.star4(pro_id);
//		    int star5 = detailMapper.star5(pro_id);
//		    mv.addObject("star1", star1);
//		    mv.addObject("star2", star2);
//		    mv.addObject("star3", star3);
//		    mv.addObject("star4", star4);
//		    mv.addObject("star5", star5);    
//		    
//		    // 리뷰 페이징
//		    int count = detailMapper.getReviewCount(pro_id);
//		    PagingResponse<ReviewVo> response = null;
//		    if(count < 1) {
//		        response = new PagingResponse<>(Collections.emptyList(), null);
//		    } else {
//		        PagingVo pagingVo = new PagingVo();
//		        pagingVo.setPage(nowpage);
//		        pagingVo.setPageSize(5);
//		        pagingVo.setRecordSize(5);
//		        
//		        try {
//		            Pagination pagination = new Pagination(count, pagingVo);
//		            pagingVo.setPagination(pagination);
//		            
//		            int offset = pagination.getLimitStart();
//		            int pageSize = pagingVo.getRecordSize();
//		            
//		            List<ReviewVo> pagingList = detailMapper.getReviewList(pro_id, offset, pageSize);
//		            response = new PagingResponse<>(pagingList, pagination);
//		            
//		            mv.addObject("pagingList", pagingList);
//		            mv.addObject("response", response);
//		            mv.addObject("pagingVo", pagingVo);
//		            mv.addObject("nowpage", nowpage);
//		        } catch (ArithmeticException e) {
//		            // 예외 처리
//		            mv.addObject("error", "Pagination error: " + e.getMessage());
//		        }
//		    }
//		    // 리뷰 좋아요 개수 (리뷰 아이디가 null이 아닌 경우에만)
//		    if (rev_id != null) {
//		        int rlike = detailMapper.countLikes(rev_id);
//		        mv.addObject("rlike", rlike);
//		    }
//		    
//		    // 3. FAQ 목록 가져오기
////		    List<FaqVo> faqList = detailMapper.getFaqList();
////		    mv.addObject("faqList", faqList);
////		    System.out.println("faqList : " + faqList);
//		    
//		    mv.setViewName("detail");
//		    return mv;	    
//		}
//		
//
//		@PostMapping("/cart")
//		@ResponseBody
//		public Map<String,Object> cart(
//				@RequestBody HashMap<String, Object> map
//				){
//
//			int count = Integer.parseInt(String.valueOf(map.get("count")));
//			
//		    // 장바구니에 상품이 존재?
//		    int being = detailMapper.incart(map);
//		 
//		    
//		    // 장바구니의 상품의 재고 수량 확인
//		    int stockCount = detailMapper.getProductStock(map);
//		  
//		    if (being == 0) {
//		        // 1. 장바구니에 없는 상품일 경우
//		        if (count > stockCount) {
//		            map.put("status", "error");
//		            map.put("message", "재고 수량을 초과하여 장바구니에 담을 수 없습니다.");
//		        } else {
//		            detailMapper.cart(map);
//		            map.put("status", "new");
//		            map.put("message", "상품을 장바구니에 담았습니다.");
//		        }
//		    } else {
//		        // 2.장바구니에 있는 상품일 경우
//		    	
//		        //   기존 장바구니 수량 가져오기
//		        int currentCount = detailMapper.getCurrentBasketCount(map);
//		        
//		        if (currentCount + count > stockCount) {
//		        	map.put("status", "error");
//		        	map.put("message", "재고 수량을 초과하여 장바구니에 담을 수 없습니다.");
//		        } else {
//		            detailMapper.cart2(map);
//		            map.put("status", "existing");
//		            map.put("message", "상품을 장바구니에 담았습니다(이미 담은 상품이 추가되었습니다).");
//		        }
//		    }
//		    return map;
//		}
//		
//		@ResponseBody
//		@PostMapping("/LikeReview")
//		public Map<String, String> likeReview(@RequestParam("rev_id") int rev_id,
//		                                      @RequestBody Map<String, Object> payload,
//		                                      ReviewVo reviewVo) {
////		    int id = (int) payload.get("id");
//			int id = 1;
//
//		    Map<String, Integer> params = new HashMap<>();
//		    params.put("rev_id", rev_id);
//		    params.put("id", id);
//
//		    int likeStatus = detailMapper.getLikeStatus(params);
//
//		    Map<String, String> response = new HashMap<>();
//		    if (likeStatus > 0) {
//		        // 좋아요가 이미 있는 경우, 좋아요 삭제
//		        detailMapper.removeLike(params);
//		        response.put("status", "removed");
//		    } else if (likeStatus == 0) {
//		        // 좋아요가 없는 경우, 좋아요 추가
//		        detailMapper.addLike(params);
//		        response.put("status", "added");
//		    }
//
//		    return response;
//		}
//}