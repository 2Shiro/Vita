package com.vita.pay.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.DeliveryVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
import com.vita.pay.domain.PayVo;
import com.vita.pay.domain.ProdVo;

@Mapper
public interface PayMapper {

	// 장바구니 목록
	List<BasketVo> getBasketList(Long id);
	
	// 장바구니 상품 조회
	ProdVo getProd(int pro_id);
	ImgsVo getImg(int pro_id);
	MakeVo getMake(int make_id);
	
	// 장바구니 특정 상품 정보
	BasketVo getBasket(Long basket_id);
	// 장바구니 상품 수량 변경
	void updateBasketCount(BasketVo basketvo);
	
	// 장바구니 상품 구매 상태
	void updateState(@Param("basket_id") Long basket_id, @Param("state") int state);
	
	// 장바구니 상품 삭제
	void removeBasketItem(@Param("basket_id") Long basketId, @Param("id") int id);
	
	// 구매 상태 상품 조회
	List<BasketVo> getPayList(Long id);
	
	// 기본 배송지 조회
	DeliveryVo getDeliveryDefualt(Long id);
	
	// 배송지 조회
	List<DeliveryVo> getDeliveryList(Long id);
	
	// 배송지 추가시에 다른 배송지의 defualt 값을 0으로 설정하는 메서드
	void resetAddDefaultForOtherAddresses(@Param("id") int id, @Param("address_id") Integer address_id);
	
	// 배송지 추가
	int addDeliveryAddress(DeliveryVo deliveryVo);
   
	// 배송지 수정시에 다른 배송지의 defualt 값을 0으로 설정하는 메서드
	void resetUpdateDefaultForOtherAddresses(@Param("id") int id, @Param("address_id") int address_id);
   
	// 배송지 업데이트
	int updateDeliveryAddress(DeliveryVo deliveryVo);
	
    // 배송지 삭제
    int deleteDeliveryAddress(@Param("id") int id, @Param("address_id") int address_id);

    // 결제 정보 저장
    void savePay(@Param("buyerId") int buyerId, 
            @Param("merchantUid") String merchantUid, 
            @Param("totalPrice") int totalPrice, 
            @Param("payMethod") String payMethod, 
            @Param("deliveryRequest") String deliveryRequest, 
            @Param("address_id") int address_id);

	PayVo getRecentPay();

    // 결제 상품 저장
    void saveGoods(@Param("id") Long id, 
                   @Param("pro_id") int pro_id, 
                   @Param("pay_id") int pay_id, 
                   @Param("count") int count,
                   @Param("price") int price);

	

}
