package com.vita.pay.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.DeliveryVo;
import com.vita.pay.domain.PayVo;
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

       if (deliveryVo.getDefualt() == 1) {
           // 다른 배송지의 defualt 값을 0으로 설정
           payMapper.resetAddDefaultForOtherAddresses(deliveryVo.getId(), null);
       }

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
       System.out.println(params);
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

       if (deliveryVo.getDefualt() == 1) {
           // 다른 배송지의 defualt 값을 0으로 설정
           payMapper.resetUpdateDefaultForOtherAddresses(deliveryVo.getId(), deliveryVo.getAddress_id());
       }

       int rowsAffected = payMapper.updateDeliveryAddress(deliveryVo);

       Map<String, Object> response = new HashMap<>();
       response.put("success", rowsAffected > 0);

       return ResponseEntity.ok(response);
   }
   
   @PostMapping("/deleteDeliveryAddress")
   public ResponseEntity<Map<String, Object>> deleteDeliveryAddress(@RequestBody Map<String, String> params, HttpServletRequest request) {
       Long id = getUserIdService.getId(request);
       
       int address_id = Integer.parseInt(params.get("address_id"));
       
       System.out.println("Request received to delete address with ID: " + address_id); // 로그 추가

       int rowsAffected = payMapper.deleteDeliveryAddress(id.intValue(), address_id);

       Map<String, Object> response = new HashMap<>();
       response.put("success", rowsAffected > 0);

       return ResponseEntity.ok(response);
   }
   
   @PostMapping("/Pay")
   public ResponseEntity<?> completePayment(@RequestBody Map<String, Object> paymentResult, HttpServletRequest request) {
       Long id = getUserIdService.getId(request);

       // paymentResult에서 필요한 데이터 추출
       String impUid = (String) paymentResult.get("imp_uid");
       String merchantUid = (String) paymentResult.get("merchant_uid");
       int buyerId = id.intValue();
       int addressId = Integer.parseInt((String) paymentResult.get("buyer_addr"));

       Map<String, Object> customData = (Map<String, Object>) paymentResult.get("custom_data");
       List<String> basketIdsStr = (List<String>) customData.get("basket_ids");
       String deliveryRequest = (String) customData.get("delivery_request");
       String payMethod = (String) customData.get("pay_method");
       int totalPrice = Integer.parseInt((String) customData.get("total_price"));

       // basketIds 리스트에서 각 항목을 long으로 변환
       List<Long> basketIds = basketIdsStr.stream()
               .map(Long::parseLong)
               .collect(Collectors.toList());

       // 결제 정보 추가
       payMapper.savePay(buyerId, merchantUid, totalPrice, payMethod, deliveryRequest, addressId);

       // 최근 결제 정보 불러오기
       PayVo recentPay = payMapper.getRecentPay();
       int pay_id = recentPay.getPay_id();
       
       // 결제 상품 추가
       for (Long basket_id : basketIds) {
    	   BasketVo basketvo = payMapper.getBasket(basket_id);
           payMapper.saveGoods(id, basketvo.getPro_id(), pay_id, basketvo.getCount(), totalPrice);
       }

       // 성공적으로 처리되었음을 클라이언트에 반환
       return ResponseEntity.ok().body(Collections.singletonMap("success", true));
   }

}
