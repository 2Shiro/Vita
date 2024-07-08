package com.vita.compare.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.compare.domain.CompareNutrientDto;
import com.vita.compare.domain.CompareProductDto;
import com.vita.domain.AllProductsDto;

@Mapper
public interface CompareMapper {

	List<AllProductsDto> findIWishtems(Long id);

	List<AllProductsDto> findBasketItems(Long id);

	List<CompareProductDto> findCompareProducts(Long productId1, Long productId2);

	List<CompareNutrientDto> findCompareNutrients(Long productId1, Long productId2);

	List<AllProductsDto> findRecentItems(@Param("proIdList") List<Long> proIdList);

	


}
