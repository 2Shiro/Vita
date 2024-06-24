package com.vita.detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vita.detail.domain.ProductVo;
import com.vita.detail.mapper.DetailMapper;


@RestController
public class DetailApiController {
	
	 @Autowired
	 private DetailMapper detailMapper;
	 
		@PostMapping("/cart")
		public Map<String,Object> cart(
				@RequestBody HashMap<String, Object> map
				){

			int count = Integer.parseInt(String.valueOf(map.get("count")));
			int price = Integer.parseInt(String.valueOf(map.get("price")));
			
		    // 장바구니에 상품이 존재?
		    int being = detailMapper.incart(map);
		 	    
		    // 장바구니의 상품의 재고 수량 확인
		    int stockCount = detailMapper.getProductStock(map);
		  
		    if (being == 0) {
		        // 1. 장바구니에 없는 상품일 경우
		        if (count > stockCount) {
		            map.put("status", "error");
		            map.put("message", "재고 수량을 초과하여 장바구니에 담을 수 없습니다.");
		        } else {
		            detailMapper.cart(map);
		            map.put("status", "new");
		            map.put("message", "상품을 장바구니에 담았습니다.");
		        }
		    } else {
		        // 2.장바구니에 있는 상품일 경우
		    	
		        //   기존 장바구니 수량 가져오기
		        int currentCount = detailMapper.getCurrentBasketCount(map);
		        
		        //  기존 장바구니의 존재하는 넣을 상품의 금액
		        int amount = detailMapper.getPrice(map);
		        
		        if (currentCount + count > stockCount) {
		        	map.put("status", "error");
		        	map.put("message", "재고 수량을 초과하여 장바구니에 담을 수 없습니다.");
		        } else {
		        	
		        	if ( price + amount >= 25000) {
		        		detailMapper.delivery(map);
		        		detailMapper.cart2(map);
		        		map.put("status", "existing");
		        		map.put("message", "상품을 장바구니에 담았습니다. </br>"
		        				+ "<span style='color: blue; font-size: small;'>이미 담은 상품이 있어 상품이 추가되었습니다.");		        		
		        	} else {
		        		detailMapper.cart2(map);
		        		map.put("status", "existing");
		        		map.put("message", "상품을 장바구니에 담았습니다. </br>"
		        				+ "<span style='color: blue; font-size: small;'>이미 담은 상품이 있어 상품이 추가되었습니다.");	
		        	}		        	
		        }
		    }
		    return map;
		}
		
		@PostMapping("/buy")
		public Map<String,Object> buy(
				@RequestBody HashMap<String, Object> map
				){			
			detailMapper.buy(map);			
			return map;
		}
		
//		@PostMapping("/LikeReview")
//		public Map<String,String> likeReview( @RequestParam("rev_id") int rev_id,
//											  @RequestBody Map<String, Object> payload,
//											  ReviewVo reviewVo) {
////	        int id = (int) payload.get("id");
//			int id = 1;
//	        Map<String, Integer> params = new HashMap<>();
//	        params.put("rev_id", rev_id);
//	        params.put("id", id);
//	
//	        int likeStatus = detailMapper.getLikeStatus(params);
//	
//	        Map<String, String> response = new HashMap<>();
//	        if (likeStatus > 0) {
//	            // 좋아요가 이미 있는 경우, 좋아요 삭제
//	            detailMapper.removeLike(params);
//	            response.put("status", "removed");
//	        } else if(likeStatus == 0) {
//	            // 좋아요가 없는 경우, 좋아요 추가
//	            detailMapper.addLike(params);
//	            response.put("status", "added");
//	        }
//	
//	        return response;
//	    }
		
		@RequestMapping("/checkWishlist")
		public Map<String, Object> checkWishlist(@RequestBody HashMap<String, Object> map,Model model) {
			
		    int pro_id = Integer.parseInt(String.valueOf(map.get("pro_id")));
		    int wish = detailMapper.getWish(map);
		    map.put("pro_id",pro_id);
		    
			if( wish==0 ) {		
				map.put("status", "not");
			} else if( wish >=1 ){								
				map.put("status", "existing");
			}
		    return map;
		}
		

	    @RequestMapping("/addWishlist")
	    public Map<String,Object> addWishlist(@RequestBody HashMap<String, Object> map) {
			int id = 1;
			map.put("id",id);
			int pro_id = Integer.parseInt(String.valueOf(map.get("pro_id")));
			map.put("pro_id",pro_id);
			
			// 위시리스트에 상품이 존재?
			int wish = detailMapper.getWish(map);
			if( wish == 0 ) {
				detailMapper.addWishlist(map);			
				map.put("status", "new");
				map.put("msg", "위시리스트에 추가되었습니다");
			} else if( wish >= 1 ){
				detailMapper.deleteWishlist(map);				
				map.put("status", "existing");
				map.put("msg", "위시리스트에서 삭제되었습니다.");

			} else {
				map.put("msg", "error");
			}
			return map;
		}
	  
		// 리뷰 페이징
//		@RequestMapping("/Detail/Reviews")
//		public ResponseEntity<Map<String, Object>> fetchReviews(@RequestParam(value = "pro_id") int pro_id,
//		                                                        @RequestParam(value = "nowpage") int nowpage) {
//		    Map<String, Object> response = new HashMap<>();
//
//		    // 페이징을 사용하여 리뷰를 가져옴
//		    int count = detailMapper.getReviewCount(pro_id);
//		    PagingResponse<ReviewVo> pagingResponse;
//		    if (count < 1) {
//		        pagingResponse = new PagingResponse<>(Collections.emptyList(), null);
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
//		            pagingResponse = new PagingResponse<>(pagingList, pagination);
//
//		            response.put("pagingList", pagingList);
//		            response.put("pagination", pagination);
//		            response.put("nowpage", nowpage);
//		        } catch (ArithmeticException e) {
//		            response.put("error", "Pagination error: " + e.getMessage());
//		            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
//		        }
//		    }
//		    return ResponseEntity.ok(response);
//		}
	    

}
