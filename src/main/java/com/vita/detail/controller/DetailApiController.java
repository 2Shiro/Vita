package com.vita.detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.detail.domain.ProductVo;
import com.vita.detail.mapper.DetailMapper;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Delegate;


@RestController
public class DetailApiController {
	
	 @Autowired
	 private DetailMapper detailMapper;
	 
	 @Autowired
	 private GetUserIdService getUserIdService;
	 
		@PostMapping("/cart")
		public Map<String,Object> cart(
										@RequestBody HashMap<String, Object> map,
										HttpServletRequest request
				){

			int count = Integer.parseInt(String.valueOf(map.get("count")));
			int price = Integer.parseInt(String.valueOf(map.get("price")));
			
			Long id = getUserIdService.getId(request);
			map.put("id", id);
			
		    // 장바구니에 상품이 존재?
		    int being = detailMapper.incart(map);
		    System.out.println("being :"+being);
		 	    
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
		    } else if(being >= 1){
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
		public Map<String,Object> buy( @RequestBody HashMap<String, Object> map
										,HttpServletRequest request
										){	
			Long id = getUserIdService.getId(request);
			map.put("id", id);
			
			detailMapper.buy(map);			
			return map;
		}
		
		@RequestMapping("/checkWishlist")
		public Map<String, Object> checkWishlist(@RequestBody HashMap<String, Object> map
												,HttpServletRequest request
												) {
			
			Long id = getUserIdService.getId(request);
			map.put("id", id);

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
	    public Map<String,Object> addWishlist(@RequestBody HashMap<String, Object> map
	    									,HttpServletRequest request) {
	    	
	    	Long id = getUserIdService.getId(request);
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
	    
	    @RequestMapping("/checkThumb")
	    public  Map<String,Object> checkthumb( @RequestBody HashMap<String,Object> map
	    									  ,HttpServletRequest request
	    									  ){
	    	Long id = getUserIdService.getId(request);
	    	map.put("id", id);
	    	int rev_id = Integer.parseInt(String.valueOf(map.get("rev_id")));
	    	map.put("rev_id", rev_id);
	    		    	
	    	// 추천 개수
	    	int thumb = detailMapper.thumb(rev_id); 
	    	map.put("thumb", thumb);
	    	
	    	int status = detailMapper.status(map);
	    	if(status > 0) {
	    		map.put("state", "liked");
	    	} else if(status == 0) {
	    		map.put("state", "not");
	    	}
	    	
	    	return map;
	    }
	    
	    @RequestMapping("/thumb")
	    public Map<String,Object> thumb( @RequestBody HashMap<String,Object> map,
	    								 HttpServletRequest request
	    								){
	    	
	    	Long id = getUserIdService.getId(request);
	    	map.put("id", id);
	    	int rev_id = Integer.parseInt(String.valueOf(map.get("rev_id")));
	    	map.put("rev_id", rev_id);

	    	
	    	// 추천 상태
	    	int status = detailMapper.status(map);	  

	    	
	    	if(status == 0) {
	    		detailMapper.addThumb(map);
	    		map.put("current", "added");
	    	} else if(status > 0) {
	    		detailMapper.removeThumb(map);
	    		map.put("current", "removed");
	    	}

	        int thumb = detailMapper.thumb(rev_id); 
	        map.put("thumb", thumb);
	    	
	    	return map;
	    }
	    
	    // 리뷰 신고
	    @PostMapping("/notify")
	    public Map<String, Object> notify(@RequestBody HashMap<String,Object> map
	    								  ,HttpServletRequest request ){
	    	Long id = getUserIdService.getId(request);
	    	map.put("id", id);
	    	int rev_id = Integer.parseInt(String.valueOf(map.get("rev_id")));
	    	map.put("rev_id", rev_id);
	    	
	    	detailMapper.notify(map);	
	    	
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
	    
		// Q&A 팝업
		@PostMapping("/qnaSubmit")
		public Map<String, Object> qna(@RequestBody HashMap<String,Object> map
										,HttpServletRequest request ){
			
			Long id = getUserIdService.getId(request);
	    	map.put("id", id);
	    	int pro_id = Integer.parseInt(String.valueOf(map.get("pro_id")));
	    	map.put("pro_id", pro_id);
	    	
	    	detailMapper.qnaSubmit(map);
	    	
	    	return map;
		}
		
		// QnA 삭제
		@RequestMapping("/deleteQnA")
		public Map<String, Object> deleteQnA(@RequestBody HashMap<String,Object> map
				,HttpServletRequest request ){
			
			Long id = getUserIdService.getId(request);
			map.put("id", id);
			
			int qna_id = Integer.parseInt(String.valueOf(map.get("qna_id")));
			map.put("qna_id", qna_id);
			
			detailMapper.deleteQ(map);
			
			return map;
		}
		
		
		// QnA 수정
		@RequestMapping("/modifyQnA")
		public Map<String, Object> modifyQnA(
							@RequestBody HashMap<String,Object> map
							,HttpServletRequest request ){
			
			Long id = getUserIdService.getId(request);
			map.put("id", id);
			
			int qna_id = Integer.parseInt(String.valueOf(map.get("qna_id")));
			map.put("qna_id", qna_id);
			detailMapper.modifyQ(map);
			
			return map;
		}
		
		
		
		// 장바구니 인기아이템 10개
//		@RequestMapping("/items")
//		public Map<String,Object> items( @RequestBody HashMap<String,Object> map ){
//			
//			List<ProductVo> items = detailMapper.getItems();
//			
//			return map;
//			
//		}

}
