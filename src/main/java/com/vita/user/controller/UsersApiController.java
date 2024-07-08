package com.vita.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.controller.GetUserIdService;
import com.vita.user.mapper.UsersMapper;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class UsersApiController {

	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private UsersMapper usersMapper;
		
    // 환불신청
    @PostMapping("/Refund")
    public ResponseEntity<String> refund(HttpServletRequest request, @RequestBody Map<String, String> requestData) {
        Long userId = getUserIdService.getId(request);

        // JSON 데이터를 받아서 변수에 저장
        int payId;
        try {
            payId = Integer.parseInt(requestData.get("pay_id"));
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body("Invalid pay_id format.");
        }
        String refundReason = requestData.get("refund_reason");

        // 디버깅 로그 추가
        System.out.println("Received pay_id: " + payId);
        System.out.println("Received refund_reason: " + refundReason);
        
        // 환불 로직 처리
        try {
            usersMapper.requestRefund(payId, refundReason);
            return ResponseEntity.ok("Refund request successfully processed.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error processing refund request: " + e.getMessage());
        }
    }

}
