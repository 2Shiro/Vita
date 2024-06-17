package com.vita.pay.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
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

	// 구매 상태 상품 조회
	List<BasketVo> getPayList(Long id);


}
