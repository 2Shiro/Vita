package com.vita.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.domain.AllProductsDto;
import com.vita.domain.HomeNutrientsDto;



@Mapper
public interface HomeMapper {

	List<AllProductsDto> findProducts();

	List<HomeNutrientsDto> findReviews();

	

}
