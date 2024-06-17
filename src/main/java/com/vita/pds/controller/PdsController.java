package com.vita.pds.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.vita.pds.service.PdsSerive;

@Controller
public class PdsController {
	@Value("${part4.upload-path}")
	private   String   uploadPath;
	
	
	
	@GetMapping("/Pds/Write")
	public ModelAndView PdsWriteForm() {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/write");
		
		return mv;
	}
	
	@PostMapping("/Pds/Submit/Write")
	public ModelAndView SubmitWrite(
			@RequestParam   HashMap<String, Object> map,  // 일반데이터	
			@RequestParam(value="upfile", required = false) 
		    //  required=false  입력하지 않을 수 있다
		    MultipartFile[]     uploadFiles     // 파일처리
			){
		// 넘어온 정보
				System.out.println("map:"   + map); 
				System.out.println("files:" + uploadFiles); 
				
				//map:{title=안녕하세요, content=<p>하염 만나서 반갑스니다<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgZmlsbD0iY3VycmVudENvbG9yIiBjbGFzcz0iYmkgYmktZXllIiB2aWV3Qm94PSIwIDAgMTYgMTYiPgogIDxwYXRoIGQ9Ik0xNiA4cy0zLTUuNS04LTUuNVMwIDggMCA4czMgNS41IDggNS41UzE2IDggMTYgOE0xLjE3MyA4YTEzIDEzIDAgMCAxIDEuNjYtMi4wNDNDNC4xMiA0LjY2OCA1Ljg4IDMuNSA4IDMuNXMzLjg3OSAxLjE2OCA1LjE2OCAyLjQ1N0ExMyAxMyAwIDAgMSAxNC44MjggOHEtLjA4Ni4xMy0uMTk1LjI4OGMtLjMzNS40OC0uODMgMS4xMi0xLjQ2NSAxLjc1NUMxMS44NzkgMTEuMzMyIDEwLjExOSAxMi41IDggMTIuNXMtMy44NzktMS4xNjgtNS4xNjgtMi40NTdBMTMgMTMgMCAwIDEgMS4xNzIgOHoiLz4KICA8cGF0aCBkPSJNOCA1LjVhMi41IDIuNSAwIDEgMCAwIDUgMi41IDIuNSAwIDAgMCAwLTVNNC41IDhhMy41IDMuNSAwIDEgMSA3IDAgMy41IDMuNSAwIDAgMS03IDAiLz4KPC9zdmc+" data-filename="image name" style="width: 732px;"></p>}
				//files:null
				 // content에서 Base64 이미지 데이터 추출 및 파일 저장
		        String content = (String) map.get("content");
		        String base64Image = extractBase64Image(content);
		        
		        if (base64Image != null) {
		            saveBase64Image(base64Image);
		        }
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("pds/view");
		
		return mv;
	}
	
	
	 private String extractBase64Image(String content) {
	        String base64Image = null;
	        if (content != null) {
	            int startIndex = content.indexOf("base64,") + 7;
	            int endIndex = content.indexOf("\"", startIndex);
	            if (startIndex > 6 && endIndex > startIndex) {
	                base64Image = content.substring(startIndex, endIndex);
	            }
	        }
	        return base64Image;
	    }
	
	 private void saveBase64Image(String base64Image) {
	        byte[] imageBytes = Base64.getDecoder().decode(base64Image);
	        try (FileOutputStream fos = new FileOutputStream(new File("src/main/resources/static/uploads/uploaded_image.png"))) {
	            fos.write(imageBytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	
	
	
	@GetMapping("/Pds/List")
	public ModelAndView PdsList() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pds/list");
		
		return mv;
	}
}
