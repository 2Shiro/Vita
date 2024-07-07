package com.vita.pds.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostListVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.domain.PostVo;
import com.vita.pds.mapper.PdsMapper;

@Service
public class PdsServiceImpl implements PdsService{
	
	@Autowired
	private PdsMapper pdsMapper;

	


	@Override
	public void deletePost(Long post_id) {
		pdsMapper.deletedPost(post_id);
		
	}


	@Override
	public void savePost(HashMap<String, Object> map) {
		System.out.println("savePost까지 왔나 ?");
		System.out.println("savePost까지 왔나 ?");
		
		Long id = Long.parseLong(map.get("id").toString()); // 유저아이뒤
		System.out.println("id" + id);
        String title = (String) map.get("title"); // 게시글 제목
        System.out.println("title" + title);
        String content = (String) map.get("content");
        System.out.println("content" + content);
        String tags = (String) map.get("tags");
        System.out.println("tags" + tags);
        String updatedContent = saveBase64ImagesAndReplaceWithUrls(content);// 게시글 내용 변환 파일저장하고 변환값 가져옴
        System.out.println("updatedContent" + updatedContent);
        
        String StringContent = updatedContent + ',' + tags;
        

       
        System.out.println("updatedContent : " + updatedContent);
        
        PostVo postVo = new PostVo();
        postVo.setId(id);
        postVo.setTitle(title);
        postVo.setContent(StringContent);
        System.out.println("postVo : " + postVo);
    
        pdsMapper.SavePost(postVo);
        System.out.println("파일저장 db저장 둘다 완료");
        
	}

	
	@Override
	public void updatePost(HashMap<String, Object> map) {
		Long id = Long.parseLong(map.get("id").toString()); // 유저 아이디
	    Long postId = Long.parseLong(map.get("postId").toString()); // 게시글 아이디
	    String title = (String) map.get("title"); // 게시글 제목
	    String content = (String) map.get("content");
	    String tags = (String) map.get("tags");
	    String updatedContent = saveBase64ImagesAndReplaceWithUrls(content); // 게시글 내용 변환 파일 저장하고 변환 값 가져옴

	    String StringContent = updatedContent + ',' + tags;

	    System.out.println("updatedContent : " + updatedContent);

	    PostVo postVo = new PostVo();
	    postVo.setPost_id(postId); // 기존 게시글 아이디 설정
	    postVo.setId(id);
	    postVo.setTitle(title);
	    postVo.setContent(StringContent);
	    System.out.println("postVo : " + postVo);

	    pdsMapper.updatePost(postVo); // 업데이트 메서드 호출
	    System.out.println("파일 저장 DB 저장 둘 다 완료");		
	}


	private String saveBase64ImagesAndReplaceWithUrls(String content) {
        if (content == null) {
            return null;
        }

        // 정규식을 사용하여 Base64 이미지를 찾기
        Pattern pattern = Pattern.compile("src=\"data:image/(png|jpg|jpeg|svg\\+xml);base64,([^\"]+)\"");

        System.out.println("정규식 사용");
        System.out.println(pattern);
        Matcher matcher = pattern.matcher(content);     
        System.out.println("matcher 사용");
        System.out.println(matcher);
        StringBuffer updatedContent = new StringBuffer();

        while (matcher.find()) {
            String base64Image = matcher.group(2);
      
            String fileExtension = matcher.group(1);
         // 확장자가 svg+xml인 경우 svg로 단순화
            if (fileExtension.equals("svg+xml")) {
                fileExtension = "svg";
            }
            String savedFileName = saveBase64Image(base64Image, fileExtension);

            // 파일 저장 후 HTML에서 해당 이미지 부분을 파일 경로로 교체
            //파일 시스템 경로가 아닌, 클라이언트가 접근할 수 있는 웹 경로를 생성합니다.
            String filePath = "/board/" + savedFileName;
            matcher.appendReplacement(updatedContent, "src=\"" + filePath + "\"");
        }
        matcher.appendTail(updatedContent);
        
        return updatedContent.toString();
    }
	
	private String saveBase64Image(String base64Image, String fileExtension) {
		System.out.println("saveBase64Image 까지옴");
		//파일저장
        byte[] imageBytes = Base64.getDecoder().decode(base64Image);
        String uuid = UUID.randomUUID().toString();
        String fileName = uuid + "." + fileExtension;
        String dirPath = "src/main/resources/static/board/";
        String filePath = dirPath + fileName;

        //경로가 없으면 생성
        File dir = new File(dirPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        try (FileOutputStream fos = new FileOutputStream(new File(filePath))) {
        	//만들어진 파일에 imageBytes 바이너리 데이터 넣기
            fos.write(imageBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("파일저장완료");
        return fileName;
    }


	@Override
	public PostViewVo findPost(Long post_id) {
		PostViewVo postVo = pdsMapper.FindPostId(post_id);
		postVo.removeHash();
		return postVo;
		
	}


	@Override
	public List<CommentsVo> findPageingComments(HashMap<String, Object> params) {
		List<CommentsVo> commentsVos = pdsMapper.FindComments(params);
		return commentsVos;
	}


	@Override
	public int findAllPost( ) {
		int  count = pdsMapper.FindListPost();
		
		return count;
	}
	


	@Override
	public int findAllMyPost(Long id) {
		int  count = pdsMapper.FindListMyPost(id);
		return count;
	}


	@Override
	public List<PostListVo> PostList(HashMap<String, Object> params) {
		List<PostListVo> list = pdsMapper.FindAllPostList(params);
		
		for (PostListVo post : list) {
            post.splitContent();
            System.out.println(post);
        }
        return list;
		
	}
	
	@Override
	public List<PostListVo> PostMyList(HashMap<String, Object> params) {
		List<PostListVo> list = pdsMapper.FindAllMyPostList(params);
		
		for (PostListVo post : list) {
            post.splitContent();
            System.out.println(post);
        }
        return list;
	}


	@Override
	public List<PostListVo> PostPopulList(HashMap<String, Object> params) {
		List<PostListVo> list = pdsMapper.FindPopulList(params);
		
		for (PostListVo post : list) {
            post.splitContent();
            System.out.println(post);
        }
        return list;
	}


	@Override
	public List<PostListVo> PostLikeList(HashMap<String, Object> params) {
        List<PostListVo> list = pdsMapper.FindPostLikeList(params);
		
		for (PostListVo post : list) {
            post.splitContent();
            System.out.println(post);
        }
        return list;
	}


	@Override
	public List<PostListVo> PostReviewList(HashMap<String, Object> params) {
        List<PostListVo> list = pdsMapper.PostReviewList(params);
		
		for (PostListVo post : list) {
            post.splitContent();
            System.out.println(post);
        }
        return list;
	}

	@Override
	public void saveComment(CommentsVo commentsVo) {
		pdsMapper.saveComment(commentsVo);
		
	}


	
	

	@Override
	public int addLike(Map<String, Long> params) {
		int result = pdsMapper.countComment(params);
		return result;
	}


	@Override
	public boolean existsLike(Map<String, Long> params) {
		 if (pdsMapper.existsLike(params)) {
			 System.out.println("존재함");
			 System.out.println("존재함");
			 pdsMapper.saveCommentLike(params);
	            return true; // 이미 존재하면 false 반환 고쳐야함 나중에 누르면 사라지게
	        }
		 pdsMapper.saveCommentLike(params);
		return true;
	}


	@Override
	public boolean existsPostLike(Map<String, Long> params) {
		if(pdsMapper.existsPostLike(params)) {
			System.out.println("존재함");
			System.out.println("존재함");
			pdsMapper.savePostLike(params);
			return true;
		}
		pdsMapper.savePostLike(params);
		return true;
	}


	@Override
	public int postAddLike(Map<String, Long> params) {
		int result = pdsMapper.countPostLike(params);
		return result;
	}


	@Override
	public void addPostReport(Map<String, Object> params) {
		pdsMapper.savePostReport(params);
		pdsMapper.updatePostState(params);
		
	}


	


	@Override
	public void addHit(HashMap<String, Object> hitMap) {
		pdsMapper.addHit(hitMap);
		
	}


	

	
	


	

	
	
	

}
