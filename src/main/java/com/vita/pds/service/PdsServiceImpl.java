package com.vita.pds.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.pds.domain.CommentsVo;
import com.vita.pds.domain.PostViewVo;
import com.vita.pds.domain.PostVo;
import com.vita.pds.mapper.PdsMapper;

@Service
public class PdsServiceImpl implements PdsService{
	
	@Autowired
	private PdsMapper pdsMapper;

	@Override
	public void savePost(HashMap<String, Object> map) {
		System.out.println("savePost까지 왔나 ?");
		System.out.println("savePost까지 왔나 ?");
		
		Long id = Long.parseLong(map.get("id").toString()); // 유저아이뒤
        String title = (String) map.get("title"); // 게시글 제목
        String content = (String) map.get("content"); 
        String updatedContent = saveBase64ImagesAndReplaceWithUrls(content);// 게시글 내용 변환 파일저장하고 변환값 가져옴
		
        String StringContent = updatedContent;
        
        System.out.println("updatedContent");
        System.out.println("updatedContent");
       
        System.out.println("updatedContent : " + updatedContent);
        
        PostVo postVo = new PostVo();
        postVo.setId(id);
        postVo.setTitle(title);
        postVo.setContent(StringContent);
        System.out.println("postVo : " + postVo);
        
        System.out.println("save까지 안가나?");
        pdsMapper.SavePost(postVo);
        System.out.println("파일저장 db저장 둘다 완료");
	}

	
	private String saveBase64ImagesAndReplaceWithUrls(String content) {
        if (content == null) {
            return null;
        }

        // 정규식을 사용하여 Base64 이미지를 찾기
        Pattern pattern = Pattern.compile("src=\"data:image/(png|jpg|jpeg|svg\\+xml);base64,([^\"]+)\"");
        System.out.println("");
        System.out.println("정규식 사용");
        System.out.println(pattern);
        Matcher matcher = pattern.matcher(content);
        System.out.println("");
        System.out.println("matcher 사용");
        System.out.println(matcher);
        StringBuffer updatedContent = new StringBuffer();

        while (matcher.find()) {
            String base64Image = matcher.group(2);
            System.out.println("");
            System.out.println("그룹2 base64Image");
            System.out.println(base64Image);
            String fileExtension = matcher.group(1);
         // 확장자가 svg+xml인 경우 svg로 단순화
            if (fileExtension.equals("svg+xml")) {
                fileExtension = "svg";
            }
            System.out.println("");
            System.out.println("그룹1 fileExtension");
            System.out.println(fileExtension);
            String savedFileName = saveBase64Image(base64Image, fileExtension);

            // 파일 저장 후 HTML에서 해당 이미지 부분을 파일 경로로 교체
            //파일 시스템 경로가 아닌, 클라이언트가 접근할 수 있는 웹 경로를 생성합니다.
            String filePath = "/uploads/" + savedFileName;
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
        String dirPath = "D:/dev/data/board/img/";
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
		return postVo;
		
	}


	@Override
	public List<CommentsVo> findPageingComments(HashMap<String, Object> params) {
		List<CommentsVo> commentsVos = pdsMapper.FindComments(params);
		return commentsVos;
	}

}
