package com.vita.basket.service;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vita.basket.domain.ModalBasketVo;
import com.vita.basket.domain.ProductBasketListVo;
import com.vita.basket.domain.ProductBasketVo;
import com.vita.basket.mapper.BasketModalMapper;
import com.vita.domain.AllProductsDto;

@Service
public class BasketModalService {
	@Autowired
	private BasketModalMapper basketModalMapper;

	@Transactional
	public ProductBasketVo saveBasket(ModalBasketVo modalBasketVo) {
		
		basketModalMapper.saveBasket(modalBasketVo);//잠바구니 저장

		ProductBasketVo basketVo = basketModalMapper.getBasketModal(modalBasketVo);
		
		
		
		
		if (basketVo.getTotal_price() > basketVo.getFree_delivery()) {
			basketVo.setFree(true);
			System.out.println("무료배송가능");
		}else {
			basketVo.setFree(false);
			basketVo.setFree_need_price(basketVo.getFree_delivery() - basketVo.getTotal_price());
			System.out.println("무료배송 불가능");
		} 
		
		NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
		basketVo.setString_total_price(numberFormat.format(basketVo.getTotal_price()));
		basketVo.setString_free_delivery(numberFormat.format(basketVo.getFree_need_price()));
		
		return basketVo;
		//저장이 끝나면 다시 db에 장바구니 데이터의 modalBasketVo.id값으로 총 price가격을 돌려줘야함
	}

	public List<ProductBasketListVo> findSimilarList(ProductBasketVo basketVo) {
		List<ProductBasketListVo> list = basketModalMapper.getSimilarList(basketVo);
		return list;
	}

	public List<ProductBasketListVo> findCombineList(ProductBasketVo basketVo) {
		List<ProductBasketListVo> list = basketModalMapper.getCombineList(basketVo);
		return list;
	}

}
