package com.vita.compare.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompareNutrientDto {
    private Long nut_id;
    private Long pro_id;
    private String name;
    private Double capacity1;
    private Double capacity2;
    private Double man_rda;
    private Double girl_rda;
    private String unit;
}
