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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	@PostMapping("/Pds/Submit/Update")
	public  ResponseEntity<Map<String, Object>> UpdateWrite(
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
		        
		        pdsService.updatePost(map);
		      
		
		        Map<String, Object> response = new HashMap<>();
		        response.put("ok", true);
		        response.put("url", "/Pds/List?nowpage=1");
		
	
		
		       return ResponseEntity.ok(response);
	}
	
		
	
	@PostMapping("/Pds/Api/Review")
	public PagingResponse<CommentsVo>  AddCommentApi(HttpServletRequest request, @RequestBody HashMap<String, Object> requestBody){
		
		Long id = getUserIdService.getId(request);
		Long post_id = Long.valueOf(requestBody.get("post_id").toString());
		String content = requestBody.get("content").toString();
		int nowPage = (int) requestBody.get("nowpage");

		
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
		
		Long post_id = Long.valueOf(requestBody.get("post_id").toString());
		int nowPage = (int) requestBody.get("nowpage");
		
		CommentsVo commentsVo = new CommentsVo();
		
	    commentsVo.setPost_id(post_id);
	    
	   
	        
		PostViewVo postVo = pdsService.findPost(commentsVo.getPost_id());
		
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
        params.put("post_id", commentsVo.getPost_id());
		
		List<CommentsVo> pageingComments = pdsService.findPageingComments(params);
		response = new PagingResponse<>(pageingComments, pagination);
		 
		return response;
	}
	@PostMapping("/Pds/Api/AddLike")
	public   ResponseEntity<Map<String, Object>> CommentAddLike(HttpServletRequest request, @RequestBody HashMap<String, Object> requestBody){
		System.out.println("AddLike");
		System.out.println("AddLike");
		
		Long id = getUserIdService.getId(request);
		Long comme_id = Long.valueOf(requestBody.get("comme_id").toString());
		
		Map<String, Long> params = new HashMap<>();
	    params.put("id", id);
	    params.put("comme_id", comme_id);
		//현제는 보여주기식 올라가는거를 처리하는데 추후 + - 해야됨
	    
	      
	    boolean success = pdsService.existsLike(params);
	    
	    Map<String, Object> response = new HashMap<>();  
	    response.put("success", success);
	    
	    if (success) {
	    	int updatedLikeCount =pdsService.addLike(params);

           response.put("like_count", updatedLikeCount);
        }
		
		
	    return ResponseEntity.ok(response);
		
	}
	
	@PostMapping("/Pds/Api/PostAddLike")
	public ResponseEntity<Map<String, Object>> PostAddLike(HttpServletRequest request, @RequestBody Map<String, Object> requestBody) {
	    Long postId = Long.valueOf(requestBody.get("post_id").toString());
	    Long id = getUserIdService.getId(request);
	    
	    Map<String, Long> params = new HashMap<>();
	    params.put("id", id);
	    params.put("post_id", postId);
	    
	    boolean success = pdsService.existsPostLike(params);
	    Map<String, Object> response = new HashMap<>();  
	    response.put("success", success);
	    // 좋아요 수 증가 로직 추가
	    if (success) {
	    	int updatedLikeCount =pdsService.postAddLike(params);
            response.put("post_like_count", updatedLikeCount);
        }
	   

	   
	    
	    return ResponseEntity.ok(response);
	}
	
	@PostMapping("/Pds/Api/Ben")
	public ResponseEntity<Map<String, Object>> PostBen(HttpServletRequest request, @RequestBody Map<String, Object> requestBody ){
		
		System.out.println("벤까지 왔나?");
		System.out.println("벤까지 왔나?");
		Long postId = Long.valueOf(requestBody.get("post_id").toString());
		System.out.println("postId" + postId);
		int ben_number = Integer.parseInt(requestBody.get("ben_number").toString());
		System.out.println("postId" + ben_number);
		
		String reason =null;		
		switch (ben_number) {
        case 1:
            // Handle case 1
            reason = "홍보 신고";
            break;
        case 2:
            // Handle case 2
            reason = "성인물 신고";
            break;
        case 3:
            // Handle case 3
            reason = requestBody.get("reason") != null ? requestBody.get("reason").toString() : "기타로 신고 값이 넘어오지 않음";
            break;
        default:
            System.err.println("Invalid ben_number in request body.");
            return ResponseEntity.badRequest().body(Map.of("error", "Invalid ben_number"));
    }
		
		System.out.println("reason" + reason);
			
		Long id = getUserIdService.getId(request);
		
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("reason", reason);
		params.put("post_id", postId);
		params.put("id", id);
		
		pdsService.addPostReport(params);
		
		 
		
		
		 Map<String, Object> response = new HashMap<>();  
		    response.put("success", "success");
		
		return ResponseEntity.ok(response);
	}
	@PostMapping("/Pds/Submit/Write")
	public  ResponseEntity<Map<String, Object>> SubmitWrite(
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
		      
		
		        Map<String, Object> response = new HashMap<>();
		        response.put("ok", true);
		        response.put("url", "/Pds/List?nowpage=1");
		
	
		
		       return ResponseEntity.ok(response);
	}
	
}
