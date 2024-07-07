package com.vita.bookmark.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.vita.bookmark.domain.BookmarkVo;




@Mapper
public interface BookmarkMapper {

	void saveBookmark(BookmarkVo bookmarkVo);

	void deleteBookmark(BookmarkVo bookmarkVo);

	

	


}
