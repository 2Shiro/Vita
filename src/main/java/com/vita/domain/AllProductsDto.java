package com.vita.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AllProductsDto {
	Long pro_id;
	String name;
	String make_name;
	String ing_id;
	String url;
	String type;
	String explain;
	int price;
	String img;
	Integer total_sell;
	Double average_rating;
	Integer wish_id;
	
	String string_average_arting;
	String[] nutrient;
	int rating;
	String reviewContent;
	
	  public void setNutrient(String[] nutrient) {
	        this.nutrient = nutrient;
	    }
}
