package com.vita.basket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.basket.domain.ModalBasketVo;
import com.vita.basket.domain.ProductBasketListVo;
import com.vita.basket.domain.ProductBasketVo;
import com.vita.domain.AllProductsDto;

@Mapper
public interface BasketModalMapper {

	void saveBasket(ModalBasketVo modalBasketVo);

	

	ProductBasketVo getBasketModal(ModalBasketVo modalBasketVo);



	List<ProductBasketListVo> getSimilarList(ProductBasketVo basketVo);



	List<ProductBasketListVo> getCombineList(ProductBasketVo basketVo);

}
