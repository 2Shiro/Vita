package com.vita.detail.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vita.detail.domain.BasketVo;
import com.vita.detail.domain.Pagination;
import com.vita.detail.domain.PagingResponse;
import com.vita.detail.domain.PagingVo;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
import com.vita.detail.mapper.DetailMapper;
import com.vita.oauth.jwt.JWTUtil;

@Controller
public class DetailController {
	
	 @Autowired
	 private JWTUtil jwtUtil;
	 @Autowired
	 private DetailMapper detailMapper;
	
	@RequestMapping("/Detail")
	public ModelAndView detail(@RequestParam(value = "pro_id") int pro_id,
	                           @RequestParam(value = "nowpage") int nowpage,
	                           BasketVo basket ) {
	    ModelAndView mv = new ModelAndView();
	    
	    mv.addObject("pro_id", pro_id);
	    
	    Long id = 1L;
	    mv.addObject("id", id);
	    
	    // 1. 상세 정보 가져오기
	    ProductVo prod = detailMapper.getProductDetail(pro_id);
	    mv.addObject("prod", prod);
	    System.out.println("상품정보 : " + prod);
	    
	    // 2. 리뷰 목록 가져오기 with Paging
	    List<ReviewVo> reviewList = detailMapper.getReviewList(pro_id, 0, 5); // 임시로 넣어둔 예제
	    mv.addObject("reviewList", reviewList);
	    System.out.println("reviewList : " + reviewList);
	    
	    // 리뷰 총 개수
	    int recount = detailMapper.getReviewCount(pro_id);
	    mv.addObject("recount", recount);
	    
	    // 리뷰 ☆ 평균
	    Double avgstar = detailMapper.getAvgStar(pro_id);
	    mv.addObject("avgstar", avgstar);
	    System.out.println("avgstar :" +avgstar);
	    
	    // 리뷰점수별 퍼센트
	    int one = detailMapper.one(pro_id);
	    int two = detailMapper.two(pro_id);
	    int three = detailMapper.three(pro_id);
	    int four = detailMapper.four(pro_id);
	    int five = detailMapper.five(pro_id);
	    mv.addObject("one", one);
	    mv.addObject("two", two);
	    mv.addObject("three", three);
	    mv.addObject("four", four);
	    mv.addObject("five", five);
	    
	    // 리뷰 평점별 인원수
	    int star1 = detailMapper.star1(pro_id);
	    int star2 = detailMapper.star2(pro_id);
	    int star3 = detailMapper.star3(pro_id);
	    int star4 = detailMapper.star4(pro_id);
	    int star5 = detailMapper.star5(pro_id);
	    mv.addObject("star1", star1);
	    mv.addObject("star2", star2);
	    mv.addObject("star3", star3);
	    mv.addObject("star4", star4);
	    mv.addObject("star5", star5);    
	    
	    // 리뷰 페이징
	    int count = detailMapper.getReviewCount(pro_id);
	    PagingResponse<ReviewVo> response = null;
	    if(count < 1) {
	        response = new PagingResponse<>(Collections.emptyList(), null);
	    } else {
	        PagingVo pagingVo = new PagingVo();
	        pagingVo.setPage(nowpage);
	        pagingVo.setPageSize(5);
	        pagingVo.setRecordSize(5);
	        
	        try {
	            Pagination pagination = new Pagination(count, pagingVo);
	            pagingVo.setPagination(pagination);
	            
	            int offset = pagination.getLimitStart();
	            int pageSize = pagingVo.getRecordSize();
	            
	            List<ReviewVo> pagingList = detailMapper.getReviewList(pro_id, offset, pageSize);
	            response = new PagingResponse<>(pagingList, pagination);
	            
	            mv.addObject("pagingList", pagingList);
	            mv.addObject("response", response);
	            mv.addObject("pagingVo", pagingVo);
	            mv.addObject("nowpage", nowpage);
	        } catch (ArithmeticException e) {
	            // 예외 처리
	            mv.addObject("error", "Pagination error: " + e.getMessage());
	        }
	    }
	    
	    // 3. FAQ 목록 가져오기
//	    List<FaqVo> faqList = detailMapper.getFaqList();
//	    mv.addObject("faqList", faqList);
//	    System.out.println("faqList : " + faqList);
	    
	    mv.setViewName("detail");
	    return mv;	    
	}
	
	@RequestMapping("/cart")
	public ModelAndView Cart(BasketVo basket,
							@RequestParam(value = "pro_id") int pro_id,	
							@RequestParam(value = "count") int count	
			) {
		
		ModelAndView mv  = new ModelAndView();
		
		// 장바구니에 상품 담기
		
		// 장바구니에 상품이 있나?
		detailMapper.incart(pro_id);
		
		// 1. 장바구니에 없는 상품일 경우
		detailMapper.cart(basket);
		System.out.println("basketbasketbasket:"+basket);
		
		// 2.장바구니에 있는 상품일 경우
		detailMapper.cart2(pro_id,count);
		
		mv.setViewName("cart");
		return mv;
	}
}