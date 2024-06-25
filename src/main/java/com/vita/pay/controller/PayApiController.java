package com.vita.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.vita.controller.GetUserIdService;
import com.vita.oauth.jwt.JWTUtil;
import com.vita.pay.domain.DeliveryVo;
import com.vita.pay.mapper.PayMapper;
import com.vita.pay.service.BasketService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/Pay")
public class PayApiController {

   @Autowired
   private JWTUtil jwtUtil;

   @Autowired
   private GetUserIdService getUserIdService;

   @Autowired
   private BasketService basketService;

   @Autowired
   private PayMapper payMapper;

   @PostMapping("/UpdateCount")
   public Map<String, Object> updateCount(@RequestBody Map<String, Object> params, HttpServletRequest request) {

       Long id = getUserIdService.getId(request);

       Long basket_id = Long.parseLong(params.get("basket_id").toString());
       int count = Integer.parseInt(params.get("count").toString());

       Map<String, Object> response = new HashMap<>();

       try {
           // 장바구니 아이템 수량 업데이트
           basketService.updateItemCount(basket_id, count);

           // 새로운 가격 정보 계산
           int prodPrice = basketService.calculateItemPrice(basket_id, count);
           int totalPrice = basketService.calculateTotalPrice(id);

           // 응답 데이터 생성
           response.put("status", "success");
           response.put("prodPrice", prodPrice);
           response.put("totalPrice", totalPrice);
       } catch (BasketService.ItemNotFoundException e) {
           response.put("status", "error");
           response.put("message", e.getMessage());
       } catch (Exception e) {
           response.put("status", "error");
           response.put("message", "예상치 못한 오류가 발생했습니다.");
       }

       return response;
   }

   @PostMapping("/UpdateState")
   public ResponseEntity<String> updateBasketState(@RequestBody Map<String, Object> payload) {

       Long basket_id = Long.valueOf(payload.get("basketId").toString());
       int state = Integer.parseInt(payload.get("state").toString());

       payMapper.updateState(basket_id, state);

       return ResponseEntity.ok("State updated successfully");

   }
   
   @PostMapping("/addDeliveryAddress")
   public ResponseEntity<Map<String, Object>> addDeliveryAddress(@RequestParam Map<String, String> params, HttpServletRequest request) {
       Long id = getUserIdService.getId(request);
       DeliveryVo deliveryVo = new DeliveryVo();
       deliveryVo.setId(id.intValue());
       deliveryVo.setName(params.get("name"));
       deliveryVo.setRecipent(params.get("recipent"));
       deliveryVo.setTel(params.get("tel"));
       deliveryVo.setZipcode(Integer.parseInt(params.get("zipcode"))); // String을 int로 변환
       deliveryVo.setAddress(params.get("address"));
       deliveryVo.setAddressdetail(params.get("addressdetail"));

       // deliveryRequest가 6이면 customRequest 값을 설정
       if ("6".equals(params.get("deliveryRequest"))) {
           deliveryVo.setReq(params.get("customRequest"));
       } else {
           deliveryVo.setReq(params.get("deliveryRequest"));
       }

       deliveryVo.setDefualt(Integer.parseInt(params.get("defualt"))); // String을 int로 변환

       int rowsAffected = payMapper.addDeliveryAddress(deliveryVo);

       Map<String, Object> response = new HashMap<>();
       response.put("success", rowsAffected > 0);

       return ResponseEntity.ok(response);
   }

   @GetMapping("/getDeliveryList")
   public ResponseEntity<Map<String, Object>> getDeliveryList(HttpServletRequest request) {
       Long id = getUserIdService.getId(request);
       List<DeliveryVo> deliveryList = payMapper.getDeliveryList(id);

       Map<String, Object> response = new HashMap<>();
       response.put("deliveryList", deliveryList);

       return ResponseEntity.ok(response);
   }
   
   @PostMapping("/updateDeliveryAddress")
   public ResponseEntity<Map<String, Object>> updateDeliveryAddress(@RequestBody Map<String, String> params, HttpServletRequest request) {
       Long id = getUserIdService.getId(request);
       DeliveryVo deliveryVo = new DeliveryVo();
       deliveryVo.setAddress_id(Integer.parseInt(params.get("address_id")));
       deliveryVo.setId(id.intValue());
       deliveryVo.setName(params.get("name"));
       deliveryVo.setRecipent(params.get("recipent"));
       deliveryVo.setTel(params.get("tel"));
       deliveryVo.setZipcode(Integer.parseInt(params.get("zipcode")));
       deliveryVo.setAddress(params.get("address"));
       deliveryVo.setAddressdetail(params.get("addressdetail"));

       if ("6".equals(params.get("deliveryRequest"))) {
           deliveryVo.setReq(params.get("customRequest"));
       } else {
           deliveryVo.setReq(params.get("deliveryRequest"));
       }

       deliveryVo.setDefualt(Integer.parseInt(params.get("defualt")));

       int rowsAffected = payMapper.updateDeliveryAddress(deliveryVo);

       Map<String, Object> response = new HashMap<>();
       response.put("success", rowsAffected > 0);

       return ResponseEntity.ok(response);
   }

}
