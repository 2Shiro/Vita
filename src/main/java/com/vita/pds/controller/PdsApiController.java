package com.vita.pds.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nimbusds.oauth2.sdk.http.HTTPRequest;
import com.vita.controller.GetUserIdService;
import com.vita.paging.domain.Pagination;
import com.vita.paging.domain.PagingResponse;
import com.vita.paging.domain.SearchVo;
import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.service.PdsService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class PdsApiController {
	
	@Autowired
	private GetUserIdService getUserIdService; 
	
	@Autowired
	private PdsService pdsService;

	@PostMapping("/Pds/Api/Review")
	public PagingResponse<CommentsVo>  AddCommentApi(HttpServletRequest request, @RequestBody HashMap<String, Object> requestBody){
		
		Long id = getUserIdService.getId(request);
		Long post_id = Long.valueOf(requestBody.get("post_id").toString());
		String content = requestBody.get("content").toString();
		int nowPage = (int) requestBody.get("nowpage");
		
		
		System.out.println("id : " + id);
		System.out.println("id : " + id);
		System.out.println("post_id : " + post_id);
		System.out.println("post_id : " + post_id);
		System.out.println("content : " + content);
		System.out.println("content : " + content);
		System.out.println("nowPage : " + nowPage);
		System.out.println("nowPage : " + nowPage);
		
		CommentsVo commentsVo = new CommentsVo();
		commentsVo.setId(id);
	    commentsVo.setPost_id(post_id);
	    commentsVo.setContent(content);
	    pdsService.saveComment(commentsVo);
	        
		PostViewVo postVo = pdsService.findPost(commentsVo.getPost_id());
		
		int count = postVo.getComment_count();
		System.out.println("count 갯수 : " + count);
		System.out.println("count 갯수 : " + count);
	
		PagingResponse<CommentsVo> response = null;
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
        params.put("post_id", commentsVo.getPost_id());
		
		List<CommentsVo> pageingComments = pdsService.findPageingComments(params);
		response = new PagingResponse<>(pageingComments, pagination);
		 
		return response;
	}
	
	@PostMapping("/Pds/Api/Comments")
	public PagingResponse<CommentsVo>  CommentApi(HttpServletRequest request, @RequestBody HashMap<String, Object> requestBody){
		
		System.out.println("여기까지오나?");
		System.out.println("여기까지오나?");
		System.out.println("여기까지오나?");
		System.out.println("여기까지오나?");
		System.out.println("여기까지오나?");
		Long post_id = Long.valueOf(requestBody.get("post_id").toString());
		int nowPage = (int) requestBody.get("nowpage");
		
		
		
		System.out.println("post_id : " + post_id);
		System.out.println("post_id : " + post_id);
		
		System.out.println("nowPage : " + nowPage);
		System.out.println("nowPage : " + nowPage);
		CommentsVo commentsVo = new CommentsVo();
		
	    commentsVo.setPost_id(post_id);
	    
	   
	        
		PostViewVo postVo = pdsService.findPost(commentsVo.getPost_id());
		
		int count = postVo.getComment_count();
		System.out.println("count 갯수 : " + count);
		System.out.println("count 갯수 : " + count);
		
		PagingResponse<CommentsVo> response = null;
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
        params.put("post_id", commentsVo.getPost_id());
		
		List<CommentsVo> pageingComments = pdsService.findPageingComments(params);
		response = new PagingResponse<>(pageingComments, pagination);
		 
		return response;
	}
}
