package com.vita.pds.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.RepaintManager;

import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.vita.paging.domain.SearchVo;
import com.vita.paging.domain.Pagination;
import com.vita.controller.GetUserIdService;
import com.vita.paging.domain.PagingResponse;
import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostListVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.domain.PostVo;
import com.vita.pds.service.PdsService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class PdsController {
	//@Value("${part4.upload-path}")
	//private   String   uploadPath;
	
	@Autowired
	private GetUserIdService getUserIdService; 
	
	@Autowired
	private PdsService pdsService;
	
	
	
	@GetMapping("/Pds/Write")
	public ModelAndView PdsWriteForm() {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/write");
		
		return mv;
	}
	
	
	
	
	
	
	@GetMapping("/Pds/List")
	public ModelAndView PdsList(HttpServletRequest request, @RequestParam("nowpage") int nowPage) {
		
		Long id = getUserIdService.getId(request);
		
		
		int myPostCount = pdsService.findAllMyPost(id);
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
        
        List<PostListVo> list = pdsService.PostList(params);
        
      
        
        System.out.println(list);
        System.out.println("-------------");
        response = new PagingResponse<>(list, pagination);
        System.out.println(response.getPagination().getStartPage());
        System.out.println(response.getPagination().getEndPage());
        
        System.out.println("222222222222222");
        
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/list");
		mv.addObject("response", response);
		mv.addObject("searchVo", searchVo);
		mv.addObject("count", count);
		mv.addObject("myPostCount", myPostCount);
		return mv;
	
	
	}
	@GetMapping("/Pds/List/MyList")
	public ModelAndView PdsListMyList(HttpServletRequest request, @RequestParam("nowpage") int nowPage) {
		System.out.println("마이뷰로옴");
		System.out.println("마이뷰로옴");
		System.out.println("마이뷰로옴");
		Long id = getUserIdService.getId(request);
		
		int myPostCount = pdsService.findAllMyPost(id);
		
		int count = pdsService.findAllMyPost(id);
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
        System.out.println("offset" + offset);
        params.put("pageSize", pageSize);
        System.out.println("pageSize" + pageSize);
        params.put("id", id);
        
        List<PostListVo> list = pdsService.PostMyList(params);
        
      
        
        System.out.println(list);
        System.out.println("-------------");
        response = new PagingResponse<>(list, pagination);
        System.out.println(response.getPagination().getStartPage());
        System.out.println(response.getPagination().getEndPage());
        
        System.out.println("222222222222222");
        
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/mylist");
		mv.addObject("response", response);
		mv.addObject("searchVo", searchVo);
		mv.addObject("count", count);
		mv.addObject("myPostCount", myPostCount);
		return mv;
	
	
	}
	@GetMapping("/Pds/Update")
	public ModelAndView PdsUpdate(HttpServletRequest request,@RequestParam("post_id") Long post_id) {
		System.out.println("일로오나?");
	    Long id = getUserIdService.getId(request);
		 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/update");
		PostViewVo postVo = pdsService.findPost(post_id);
		postVo.removeHash();
		System.out.println("---------------------");
		System.out.println(postVo);
		String contentMarks = null;
		if(postVo.getContent_mark() != null) {
			 contentMarks = String.join(" ", Arrays.stream(postVo.getContent_mark())
	                .map(mark -> "#" + mark)
	                .toArray(String[]::new));
		}
		
		 
		mv.addObject("postVo", postVo);
		mv.addObject("contentMarks", contentMarks);
		return mv;
	}
	
	
	@GetMapping("/Pds/View")
	public ModelAndView PdsVeiw(HttpServletRequest request, @RequestParam("post_id") Long post_id, @RequestParam("nowpage") int nowPage) {
		System.out.println("/Pds/View로 왔나?");
		System.out.println("postId : " + post_id);
		System.out.println("nowPage : " + nowPage);
		
		boolean myPostView = false;
	    Long id = getUserIdService.getId(request);
		HashMap<String, Object> hitMap = new HashMap<>();
		hitMap.put("post_id", post_id);
		hitMap.put("id", id);
		pdsService.addHit(hitMap);
		PostViewVo postVo = pdsService.findPost(post_id);
		postVo.removeHash();
		String contentMarks = null;
		if(postVo.getContent_mark() != null) {
			 contentMarks = String.join(" ", Arrays.stream(postVo.getContent_mark())
	                .map(mark -> "#" + mark)
	                .toArray(String[]::new));
		}
		
		
		
		/* ------------댓글 페이징-----------------  */
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
        params.put("post_id", post_id);
		
		List<CommentsVo> pageingComments = pdsService.findPageingComments(params);
		response = new PagingResponse<>(pageingComments, pagination);
		
		System.out.println("---------------------");
		System.out.println("---------------------");
		System.out.println(response.getList());
		System.out.println("---------------------");
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("response",response);
		mv.addObject("nowpage", nowPage);
		mv.addObject("searchVo", searchVo);
		mv.addObject("postVo", postVo);
		mv.addObject("post_id", post_id);
		mv.addObject("totalPageCount", pagination.getTotalPageCount());
		System.out.println("totalPageCount : " +  pagination.getTotalPageCount());
		mv.setViewName("pds/view");
		mv.addObject("contentMarks", contentMarks);
		return mv;
	}
	
}











