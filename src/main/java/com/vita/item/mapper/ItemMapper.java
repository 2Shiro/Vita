package com.vita.item.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.domain.AllProductsDto;
import com.vita.domain.HomeNutrientsDto;
import com.vita.item.domain.SearchLikeVo;



@Mapper
public interface ItemMapper {

	

	List<AllProductsDto> findLikeProducts(SearchLikeVo searchLikeVo);

	List<HomeNutrientsDto> findLikenutrients();

	List<AllProductsDto> findLikeGoodProducts(SearchLikeVo searchLikeVo);

	List<AllProductsDto> findPriceProducts(SearchLikeVo searchLikeVo);

	

	


	
}
