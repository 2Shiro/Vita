package com.vita.pay.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.MakeVo;
import com.vita.pay.domain.ProdVo;

@Mapper
public interface PayMapper {

	// 장바구니 목록
	List<BasketVo> getBasketList(Long userId);
	
	// 장바구니 상품에 대한 정보
	ProdVo getProd(int pro_id);
	ImgsVo getImg(int pro_id);
	MakeVo getMake(int make_id);

}
