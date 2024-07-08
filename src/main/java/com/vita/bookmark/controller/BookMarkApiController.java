package com.vita.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.vita.bookmark.domain.BookmarkVo;
import com.vita.bookmark.mapper.BookmarkMapper;
import com.vita.controller.GetUserIdService;

import jakarta.servlet.http.HttpServletRequest;



@RestController
public class BookMarkApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private BookmarkMapper bookmarkMapper;

	@PostMapping("/Bookmark/Api/AddBook")
	public ResponseEntity<String> AddBookMark(HttpServletRequest request,@RequestBody BookmarkVo bookmarkVo){
		
		System.out.println(bookmarkVo);
		System.out.println(bookmarkVo);
		Long id = getUserIdService.getId(request);
		
		bookmarkVo.setId(id);
		bookmarkMapper.saveBookmark(bookmarkVo);
		
		return ResponseEntity.ok("북마크가 존재안함 insert");
		
	}
	@PostMapping("/Bookmark/Api/DeleteBook")
	public ResponseEntity<String> DeleteBookMark(HttpServletRequest request,@RequestBody BookmarkVo bookmarkVo){
		
		System.out.println(bookmarkVo);
		System.out.println(bookmarkVo);
		Long id = getUserIdService.getId(request);
		
		bookmarkVo.setId(id);
		bookmarkMapper.deleteBookmark(bookmarkVo);
		
		return ResponseEntity.ok("북마크삭제함");
		
	}
}
