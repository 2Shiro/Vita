package com.vita.detail.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.detail.domain.Pagination;
import com.vita.detail.domain.PagingResponse;
import com.vita.detail.domain.PagingVo;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.domain.ReviewVo;
import com.vita.detail.mapper.DetailMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DetailController {
	
	 @Autowired
	 private DetailMapper detailMapper;
	 
	 @Autowired
	 private GetUserIdService getUserIdService;
	
		@RequestMapping("/Detail")
		public ModelAndView detail( @RequestParam(value = "pro_id") int pro_id,
		                            @RequestParam(value = "nowpage") int nowpage,
 		                            HttpServletRequest request,
 		                            HttpServletResponse response) {
			
		    ModelAndView mv = new ModelAndView();
		    
		    mv.addObject("pro_id", pro_id);
		    
		    // 쿠키 저장
	        Cookie[] cookies = request.getCookies();
	        List<Integer> proIdList = new ArrayList<>();

	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("pro_id_list")) {
	                    String decodedValue = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
	                    String[] proIdStrings = decodedValue.split(",");
	                    proIdList = Arrays.stream(proIdStrings)
	                                      .map(Integer::parseInt)
	                                      .collect(Collectors.toList());
	                }
	            }
	        }
	        
	        if (!proIdList.contains(pro_id)) {
	            proIdList.add(pro_id);
	        }

	        String proIdListString = proIdList.stream()
	                                          .map(String::valueOf)
	                                          .collect(Collectors.joining(","));
	        String encodedValue = URLEncoder.encode(proIdListString, StandardCharsets.UTF_8);

	        Cookie proIdListCookie = new Cookie("pro_id_list", encodedValue);
	        proIdListCookie.setMaxAge(7 * 24 * 60 * 60); 
	        response.addCookie(proIdListCookie);

	        List<Integer> sortedProIdList = proIdList.stream().sorted().collect(Collectors.toList());
	        mv.addObject("sortedProIdList", sortedProIdList);
	        
		    Long id = getUserIdService.getId(request);
		    mv.addObject("id", id);
		    
		    // 1. 상세 정보 가져오기
		    ProductVo prod = detailMapper.getProductDetail(pro_id);
		    mv.addObject("prod", prod);
		    
	        if (prod == null) {
	            throw new NoSuchElementException("Product not found with ID: " + pro_id);
	        }
	        System.out.println("prodprodprodprod:"+prod);
		    System.out.println("imgListimgListimgList"+prod.getImg());
		    System.out.println("imageimageimageimage"+prod.getImage());
		    int price =prod.getPro_price();//23000
		    
		    NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
		    String f_Price = numberFormat.format(price);
		    
		    String img = prod.getImg();
		    String [] imgs = img.split(", ");
		    mv.addObject("imgs", imgs);
	        for (String imgElement : imgs) {
	            System.out.println("imgsimgsimgs"+imgElement);
	        };
		    
		    mv.addObject("f_Price", f_Price);
		    System.out.println("formattedPrice:"+f_Price);
		    
		    // 2. 베스트 리뷰 5개 가져오기
		    List<ReviewVo> bestReviewList = detailMapper.bestReviewList(pro_id);
		    mv.addObject("bestReviewList", bestReviewList);
		    
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
		    
		    // 3. Q&A
		    
		    //    비밀글 포함
		    List<ProductVo> qnaList5 = detailMapper.getQnaList5(pro_id);
		    mv.addObject("qnaList", qnaList5);
		    
		    //    비밀글 제외
		    List<ProductVo> withoutSecret = detailMapper.withoutSecret(pro_id);
		    mv.addObject("withoutSecret", withoutSecret);
		    
		    int qnaCount = detailMapper.countQna(pro_id);
		    mv.addObject("qnaCount", qnaCount);
		    
		    // 4. 판매자 정보
		    List<ProductVo> seller = detailMapper.getSellerInfo(pro_id);
		    mv.addObject("seller", seller);
		    
		    StringBuilder sb = new StringBuilder();
		    
		    ProductVo seller1 = seller.get(0);
		    String add1 = seller1.getAddress();
		    String add2 = seller1.getAddressdetail();
		    String tel = seller1.getTel();
		    String bname = seller1.getBrand_name();
		    
		    String address = sb.append(add1).append(" ").append(add2).toString();
		    mv.addObject("address", address);
		    mv.addObject("tel", tel);
		    mv.addObject("bname", bname);

		    //  장바구니 추천 아이템
	    	List<ProductVo> prodList = detailMapper.getProdList(pro_id);
	    	mv.addObject("prodList", prodList);
	    	
	    	// 장바구니 인기상품
	    	List<ProductVo> popList = detailMapper.getpopList();
		    
	    	mv.setViewName("detail6");
	    	
		    return mv;	    
		}
		
		// 쿠키 삭제 페이지
	    @RequestMapping("/deleteCookie")
	    public ModelAndView deleteCookie(HttpServletRequest request, HttpServletResponse response) {
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("pro_id_list")) {
	                    cookie.setMaxAge(0); // Delete the cookie
	                    response.addCookie(cookie);
	                }
	            }
	        }
	        return new ModelAndView("redirect:/Detail");
	    }
	    
	    @RequestMapping("/reviews")
	    public ModelAndView test(@RequestParam(value = "pro_id") int pro_id,
	    						 @RequestParam(value = "nowpage") int nowpage,
	    						 @RequestParam(value="keyword",defaultValue = "none") String keyword,
	    						 @RequestParam(value = "rating", defaultValue = "0") int rating,
	    						 HttpServletRequest request) {
	    	
	    	ModelAndView mv = new ModelAndView();
	    	
	    	Long id = getUserIdService.getId(request);
		    mv.addObject("id", id);  
		    mv.addObject("pro_id", pro_id);
		    
		    ProductVo prod = detailMapper.getProductDetail(pro_id);
		    mv.addObject("prod", prod);
		    
		    String origin = keyword;
		    keyword = keyword.replaceAll(" ", "");
		    
		    // 리뷰 목록 
		    List<ReviewVo> reviewList = new ArrayList<>();
	        if(keyword.equals("none")) {
	            if (rating == 0) {
	                reviewList = detailMapper.getReviewList(pro_id);
	            } else {
	                reviewList = detailMapper.getReviewListByRatings(pro_id, rating);
	            }
	        } else {
	        	if (rating == 0) {
	        		reviewList = detailMapper.getSearchReviewList(pro_id, keyword);
	        	} else {
	        		reviewList = detailMapper.getSearchReviewListByRatings(pro_id, keyword,rating);
	        	}
	        }
		    
		    mv.addObject("reviewList", reviewList);
		    
		    System.out.println("reviewListreviewListreviewList"+reviewList);
		    
		    
		   int recount = detailMapper.getReviewCount(pro_id);
		   mv.addObject("recount", recount);
		   
		   int count = 0;
		   
		   // 검색어 별 count
	        if(keyword.equals("none")) {
	            if(rating == 0) {
	                count = detailMapper.getReviewCount(pro_id);
	            } else {
	                count = detailMapper.getReviewCountByRatings(pro_id, rating);
	            }
	        } else {
	        	if(rating == 0) {
	        		 count = detailMapper.getSearchReviewCount(pro_id, keyword);
	        	}else {
	        		count = detailMapper.getSearchReviewCountByRatings(pro_id, keyword,rating);
	        	}
	        }
		   mv.addObject("count", count);
		   
		   PagingResponse<ReviewVo> response = null;
			if (count < 1 ) {
				response = new PagingResponse<>(Collections.emptyList(), null);
			}
		    
	       PagingVo pagingVo = new PagingVo();
	       pagingVo.setPage(nowpage);
	       pagingVo.setPageSize(5);
	       pagingVo.setRecordSize(5);
	       
	      Pagination pagination = new Pagination(count, pagingVo);
	      pagingVo.setPagination(pagination);
	      
	      int pageSize = pagingVo.getPageSize();
	      int offset = pagingVo.getOffset();
//	      int pageSize = pagingVo.getPageSize();
//	      int offset = (nowpage-1)*pageSize;
	      
	      List<ReviewVo> pagingList = new ArrayList<>();
	      
	        if(keyword.equals("none")) {
	            if(rating == 0) {
	                pagingList = detailMapper.getReListPaging(pro_id, offset, pageSize);
	            } else {
	                pagingList = detailMapper.getReListPagingByRatings(pro_id, rating, offset, pageSize);
	            }
	        } else {
	        	if(rating == 0) {
	        		pagingList = detailMapper.getReListPagingSearch(pro_id, keyword, offset, pageSize);
	        	} else {
	        		pagingList = detailMapper.getReListPagingSearchByRatings(pro_id, keyword, offset, pageSize, rating);
	        	}
	        }
	     response = new PagingResponse<>(pagingList, pagination);
	     
	     System.out.println("nowpagenowpagenowpage"+nowpage);
	     System.out.println("offsetoffsetoffset"+offset);
	     System.out.println("pagingListpagingListpagingList"+pagingList);
	     
//	     keyword = origin;
	      
	     mv.addObject("response", response); 
	     mv.addObject("pagingVo", pagingVo);
	     mv.addObject("nowpage", nowpage);
	     mv.addObject("keyword", keyword);
	      
		    
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
	    
	    // 가장 많은 추천을 받을 리뷰
	    ReviewVo best = detailMapper.getBestReview(pro_id);
	    mv.addObject("best", best);

    	mv.setViewName("reviews3");
    	return mv;
    	
	    } 
	    
	    @RequestMapping("/QnA")
	    public ModelAndView qna(
	    		@RequestParam(value="keyword",defaultValue = "none") String keyword,
	    		@RequestParam(value = "pro_id",defaultValue = "") int pro_id,
	    		@RequestParam(value = "nowpage") int nowpage,
	    		@RequestParam(value = "q_type",defaultValue = "0") int q_type,
	    		HttpServletRequest request  ) {
	    	
	    	ModelAndView mv = new ModelAndView();
	    	
	    	Long id = getUserIdService.getId(request);
	    	mv.addObject("id", id);  
	    	mv.addObject("pro_id", pro_id);
	    	
		    ProductVo prod = detailMapper.getProductDetail(pro_id);
		    mv.addObject("prod", prod);
	    	
	    	System.out.println("pro_idpro_idpro_id:"+pro_id);
	    	
	    	List<ProductVo> prodList = detailMapper.getProdList(pro_id);
	    	mv.addObject("prodList", prodList);

			System.out.println("prodListprodListprodList"+prodList);
			// 검색
			String origin = keyword;
			keyword = keyword.replaceAll(" ", "");
			
			// QnA 목록 가져오기
			List<ProductVo> qnaList = new ArrayList<>();
			if(keyword.equals("none")) {
				if(q_type == 0) {
					qnaList = detailMapper.getQnaList(pro_id);
				} else {
					qnaList = detailMapper.getQnaListSorted(pro_id,q_type);
				}
			} else {
				if(q_type == 0) {
					qnaList = detailMapper.getSearchList(keyword,pro_id);
				} else {
					qnaList = detailMapper.getSearchListSorted(keyword,pro_id,q_type);
				}
			}
			System.out.println("qnaListqnaListqnaList"+qnaList);
			
			// 페이징
			int count= 0;
			
			// 검색어 별 count
			if(keyword.equals("none")) {
				if(q_type == 0) {
					count = detailMapper.countQna(pro_id);
				} else {
					count = detailMapper.countQnaSorted(pro_id,q_type);
				}
			}else {
				if(q_type == 0) {
					for(int i = 0; i < qnaList.size(); i++) {
						count++;
					}
				}else {
					count = detailMapper.countQnaSS(keyword,pro_id,q_type);
				}
			}
			
			PagingResponse<ProductVo> response = null;
			if (count < 1 ) {
				response = new PagingResponse<>(Collections.emptyList(), null);
			}
			// 페이징을 위한 초기 설정값
			PagingVo pagingVo = new PagingVo();
			pagingVo.setPage(nowpage);
			pagingVo.setPageSize(5);
			pagingVo.setRecordSize(3);
			
			// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
			Pagination pagination = new Pagination(count, pagingVo);
			pagingVo.setPagination(pagination);	
			
			int offset = pagingVo.getOffset();
			int pageSize = pagingVo.getPageSize();
			
			List<ProductVo> pagingList = new ArrayList<>();
			
			if(keyword.equals("none")){
				if(q_type == 0) {
					pagingList = detailMapper.getQnaListPaging(offset,pageSize,pro_id);
				} else {
					pagingList = detailMapper.getQnaListPagingSorted(offset,pageSize,pro_id,q_type);
				}
			} else {
				if(q_type == 0) {
					pagingList = detailMapper.getQnaListPagingSearch(offset,pageSize,keyword,pro_id,id);
				} else {
					pagingList = detailMapper.getQnaListPagingSearchSorted(offset,pageSize,keyword,pro_id,id,q_type);
				}
				
			}
			System.out.println("pagingListpagingList"+pagingList);
			response = new PagingResponse<>(pagingList, pagination);
			
			// 검색어 원래 값으로 돌리기
			keyword = origin;
			
			mv.addObject("response", response); 
		    mv.addObject("pagingVo", pagingVo);
		    mv.addObject("nowpage", nowpage);
		    mv.addObject("keyword", keyword);
		    
	    	mv.setViewName("qna");
	    	return mv;
	    }
    	
		
}
    	
		
