package com.vita.pds.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
	
	@PostMapping("/Pds/Submit/Write")
	public ModelAndView SubmitWrite(
			HttpServletRequest request,
			@RequestParam   HashMap<String, Object> map,  // 일반데이터	
			@RequestParam(value="upfile", required = false) 
		    //  required=false  입력하지 않을 수 있다
		    MultipartFile[]     uploadFiles     // 파일처리
			){
		// 넘어온 정보
				System.out.println("");
				System.out.println("map:"   + map); 
				System.out.println("files:" + uploadFiles); 
				
				//map:{title=안녕하세요, content=<p>하염 만나서 반갑스니다<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgZmlsbD0iY3VycmVudENvbG9yIiBjbGFzcz0iYmkgYmktZXllIiB2aWV3Qm94PSIwIDAgMTYgMTYiPgogIDxwYXRoIGQ9Ik0xNiA4cy0zLTUuNS04LTUuNVMwIDggMCA4czMgNS41IDggNS41UzE2IDggMTYgOE0xLjE3MyA4YTEzIDEzIDAgMCAxIDEuNjYtMi4wNDNDNC4xMiA0LjY2OCA1Ljg4IDMuNSA4IDMuNXMzLjg3OSAxLjE2OCA1LjE2OCAyLjQ1N0ExMyAxMyAwIDAgMSAxNC44MjggOHEtLjA4Ni4xMy0uMTk1LjI4OGMtLjMzNS40OC0uODMgMS4xMi0xLjQ2NSAxLjc1NUMxMS44NzkgMTEuMzMyIDEwLjExOSAxMi41IDggMTIuNXMtMy44NzktMS4xNjgtNS4xNjgtMi40NTdBMTMgMTMgMCAwIDEgMS4xNzIgOHoiLz4KICA8cGF0aCBkPSJNOCA1LjVhMi41IDIuNSAwIDEgMCAwIDUgMi41IDIuNSAwIDAgMCAwLTVNNC41IDhhMy41IDMuNSAwIDEgMSA3IDAgMy41IDMuNSAwIDAgMS03IDAiLz4KPC9zdmc+" data-filename="image name" style="width: 732px;"></p>}
				//files:null
				 // content에서 Base64 이미지 데이터 추출 및 파일 저장
		        String content = (String) map.get("content");
		        System.out.println("");
		        System.out.println("content값만 가져온거");
		        System.out.println(content);
		        
		        Long id = getUserIdService.getId(request); // id 가져오기
		        System.out.println("유저 아이디 가져오기 : " + id);
		        map.put("id", id);
		        
		        pdsService.savePost(map);
		      
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("pds/view");
		
		return mv;
	}
	
	
	
	
	@GetMapping("/Pds/List")
	public ModelAndView PdsList() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/list");
		
		return mv;
	}
	@GetMapping("/Pds/View")
	public ModelAndView PdsVeiw(@RequestParam("post_id") Long post_id, @RequestParam("nowpage") int nowPage) {
		System.out.println("/Pds/View로 왔나?");
		System.out.println("postId : " + post_id);
		System.out.println("nowPage : " + nowPage);
		
		
		PostViewVo postVo = pdsService.findPost(post_id);
		System.out.println("값을 가져옴");
		System.out.println("postVo : " + postVo);
		
		
		/* ------------댓글 페이징-----------------  */
		int count = postVo.getComment_count();
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
		
		System.out.println("pageingComments :" + pageingComments);
		System.out.println("pageingComments :" + pageingComments);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("postVo", postVo);
		mv.setViewName("pds/view");
		
		return mv;
	}
	
}











