package com.vita.pds.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nimbusds.oauth2.sdk.http.HTTPRequest;
import com.vita.controller.GetUserIdService;
import com.vita.paging.domain.Pagination;
import com.vita.paging.domain.PagingResponse;
import com.vita.paging.domain.SearchVo;
import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostListVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.service.PdsService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class PdsApiListController {
	
	@Autowired
	private GetUserIdService getUserIdService; 
	
	@Autowired
	private PdsService pdsService;

	@PostMapping("/Pds/Api/List/Order")
    public ResponseEntity<Map<String, Object>> PdsApiListOrder(HttpServletRequest request,
    		@RequestBody Map<String, Object> requestData ) {
		
		Long id = getUserIdService.getId(request);
		int nowPage =1;
		String orderType = (String) requestData.get("orderType");
	    
				
		int count = pdsService.findAllPost();
		System.out.println("count 갯수 : " + count);
		System.out.println("count 갯수 : " + count);
		
		PagingResponse<PostListVo> response = null;
		if( count<1 ) {
			response = new PagingResponse<>(Collections.emptyList(), null); //초기화
		}
		// 페이징을 위한 초기설정값
		SearchVo searchVo = new SearchVo();
		searchVo.setPage(nowPage); // 페이지번호 처음 1 고정	
		searchVo.setPageSize(10); //화면 하단에 출력할 페이징 사이즈
		
		Pagination pagination = new Pagination(count, searchVo); // Offset값을 만들기위해
		searchVo.setPagination(pagination);//몇개를 보여줄지 이두개가  OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY; 이값
		
		int    offset   = pagination.getLimitStart();
		int    pageSize = searchVo.getRecordSize();
		
		HashMap<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("pageSize", pageSize);
        params.put("id", id);
        
	    
        List<PostListVo> list =null;
        switch (orderType) {
            case "1":
                // 최신순 처리 로직
                list = pdsService.PostList(params);
                break;
            case "2":
                // 인기순 처리 로직
                list = pdsService.PostPopulList(params);
                break;
            case "3":
                // 좋아요순 처리 로직
                list = pdsService.PostLikeList(params);
                break;
            case "4":
                // 댓글순 처리 로직
                list = pdsService.PostReviewList(params);
                break;
            default:
                list = pdsService.PostList(params); // 기본 정렬 로직으로 최신순을 사용
                break;
        }
		
		
        response = new PagingResponse<>(list, pagination);
        
        HashMap<String, Object> result = new HashMap<>();
        result.put("response", response);
        result.put("searchVo", searchVo);
        
        return  ResponseEntity.ok(result);
       
	}
	
	
	
	
}
