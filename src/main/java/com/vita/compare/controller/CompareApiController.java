package com.vita.compare.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vita.compare.domain.CompareNutrientDto;
import com.vita.compare.domain.CompareProductDto;
import com.vita.compare.service.CompareService;
import com.vita.controller.GetUserIdService;
import com.vita.gpt.service.OpenAiService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class CompareApiController {
	
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private CompareService compareService; 
	
	@Autowired
    private OpenAiService openAiService;
	
	
	
	@PostMapping("/Compare/Api/Go")
    public ResponseEntity<Map<String, Object>> CompareGO(HttpServletRequest request, @RequestBody Map<String, Object> compareRequest) throws IOException {
        Long productId1 = Long.valueOf(compareRequest.get("productId1").toString());
        Long productId2 = Long.valueOf(compareRequest.get("productId2").toString());

        List<CompareProductDto> products = compareService.findCompareProducts(compareRequest);
        List<CompareNutrientDto> nutrients = compareService.findCompareNutrients(compareRequest);

        Map<String, Object> response = new HashMap<>();
        response.put("products", products);
        response.put("nutrients", nutrients);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/Compare/Api/AiCompare")
    public ResponseEntity<Map<String, Object>> CompareAi(HttpServletRequest request, @RequestBody Map<String, Object> compareRequest) throws IOException {
        Long productId1 = Long.valueOf(compareRequest.get("productId1").toString());
        Long productId2 = Long.valueOf(compareRequest.get("productId2").toString());

        List<CompareProductDto> products = compareService.findCompareProducts(compareRequest);
        List<CompareNutrientDto> nutrients = compareService.findCompareNutrients(compareRequest);

        CompareProductDto product1 = products.get(0);
        CompareProductDto product2 = products.get(1);

        StringBuilder product1Info = new StringBuilder();
        product1Info.append("이름: ").append(product1.getName()).append("\n")
                    .append("설명: ").append(product1.getExplain()).append("\n")
                    .append("가격: ").append(product1.getPrice()).append("원\n")
                    .append("섭취 방법: ").append(product1.getTake()).append("\n");
                   

        StringBuilder product2Info = new StringBuilder();
        product2Info.append("이름: ").append(product2.getName()).append("\n")
                    .append("설명: ").append(product2.getExplain()).append("\n")
                    .append("가격: ").append(product2.getPrice()).append("원\n")
                    .append("섭취 방법: ").append(product2.getTake()).append("\n");
                   

        StringBuilder nutrientInfo = new StringBuilder();
        for (CompareNutrientDto nutrient : nutrients) {
            nutrientInfo.append(nutrient.getName()).append(": 제품 1 -> ").append(nutrient.getCapacity1()).append(nutrient.getUnit())
                        .append(", 제품 2 -> ").append(nutrient.getCapacity2()).append(nutrient.getUnit())
                        .append(", 권장량 -> 남성: ").append(nutrient.getMan_rda()).append(nutrient.getUnit());
                        
        }

        String prompt = "다음 두 비타민 제품을 비교하고 추천해 주세요:\n\n"
                + "제품 1:\n" + product1Info.toString() + "\n"
                + "제품 2:\n" + product2Info.toString() + "\n"
                + "다음은 각 제품의 성분과 권장량입니다:\n" + nutrientInfo.toString() + "\n\n"
                + "각 제품의 장단점을 설명하고, 섭취 방법의 차이와 가격 차이를 비교해 주세요. 또한, 일반적인 사람들이 두 제품을 함께 섭취하는 것이 좋은지, 하나의 제품만 섭취하는 것이 좋은지에 대해 알려주세요. "
                + "두 제품의 성분이 많은 종합비타민일 경우, 따로 먹는 것이 효율적이라면 그 이유를 설명해 주세요.\n\n"
                + "제품 1의 경우, 권장량에 비해 부족한 성분이 무엇인지, 그리고 권장량에 비해 얼마나 부족한지 설명해 주세요. "
                + "제품 1에 없거나 부족한 성분을 보충할 수 있는 비타민 성분을 추천해 주세요.\n\n"
                + "제품 2의 경우도 동일하게 권장량에 비해 부족한 성분이 무엇인지, 그리고 권장량에 비해 얼마나 부족한지 설명해 주세요. "
                + "제품 2에 없거나 부족한 성분을 보충할 수 있는 비타민 성분을 추천해 주세요.";

        String comparisonResult = openAiService.getComparison(prompt);

        Map<String, Object> response = new HashMap<>();
        response.put("comparisonResult", comparisonResult);

        return ResponseEntity.ok(response);
    }

}
