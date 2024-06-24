package com.vita.detail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vita.detail.domain.FaqVo;
import com.vita.detail.domain.Pagination;
import com.vita.detail.domain.PagingVo;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
import com.vita.detail.mapper.DetailMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DetailController {
	
	 @Autowired
	 private DetailMapper detailMapper;
	
		@RequestMapping("/Detail")
		public ModelAndView detail(@RequestParam(value = "pro_id") int pro_id,
		                           @RequestParam(value = "nowpage") int nowpage,
 		                           HttpServletRequest request) {
		    ModelAndView mv = new ModelAndView();
		    
		    mv.addObject("pro_id", pro_id);
		    
		    int id = 1;
		    mv.addObject("id", id);
		    
		    // 1. 상세 정보 가져오기
		    ProductVo prod = detailMapper.getProductDetail(pro_id);
		    mv.addObject("prod", prod);
		    
		    // 2. 리뷰 목록 가져오기 with Paging
		    int offset = (nowpage - 1) * 5;
		    List<ReviewVo> reviewList = detailMapper.getReviewList(pro_id, offset, 5);
		    mv.addObject("reviewList", reviewList);
		    
		    // 리뷰 총 개수
		    int recount = detailMapper.getReviewCount(pro_id);
		    mv.addObject("recount", recount);
		    
		    // 리뷰 ☆ 평균
		    Double avgstar = detailMapper.getAvgStar(pro_id);
		    mv.addObject("avgstar", avgstar);
		    
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
		    PagingVo pagingVo = new PagingVo();
		    pagingVo.setPage(nowpage);
		    pagingVo.setPageSize(5);
		    pagingVo.setRecordSize(5);
		    Pagination pagination = new Pagination(recount, pagingVo);
		    pagingVo.setPagination(pagination);
		    mv.addObject("pagingVo", pagingVo);

		    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
		        mv.setViewName("detail :: #reviews");
		    } else {
		        mv.setViewName("detail5");
		    }
		    // 리뷰 좋아요 개수
//		    int rlike = detailMapper.countLikes(rev_id);
//		    mv.addObject("rlike", rlike);
		    
		    // 3. FAQ 목록 가져오기
		    List<FaqVo> faqList = detailMapper.getFaqList();
		    mv.addObject("faqList", faqList);
		    System.out.println("faqList : " + faqList);
		    
		    // 장바구니 추천 아이템
	    	List<ProductVo> prodList = detailMapper.getProdList(pro_id);
	    	mv.addObject("prodList", prodList);
	    	System.out.println("prodListprodListprodList :"+prodList);
		    
		    return mv;	    
		}
		


		


		
		
}