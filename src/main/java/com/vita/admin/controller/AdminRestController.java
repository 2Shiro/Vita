package com.vita.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vita.admin.domain.AdminVo;
import com.vita.admin.domain.BenVo;
import com.vita.admin.domain.FormVo;
import com.vita.admin.domain.ImgsVo;
import com.vita.admin.domain.IngredientVo;
import com.vita.admin.domain.MakeVo;
import com.vita.admin.domain.NutrientVo;
import com.vita.admin.domain.PostVo;
import com.vita.admin.domain.ProductVo;
import com.vita.admin.domain.ReportVo;
import com.vita.admin.domain.StockVo;
import com.vita.admin.mapper.AdminMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class AdminRestController {
	
	@Autowired
	AdminMapper adminMapper;
	
	@GetMapping("/GetNewAdminId")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getNewAdminId() {
	    Integer newAdminId = adminMapper.LgetadminId();
	    System.out.println("New Admin ID: " + newAdminId);
	    Map<String, Object> response = new HashMap<>();
	    response.put("success", newAdminId != null);
	    response.put("newAdminId", newAdminId);
	    return ResponseEntity.ok(response);
	}
	@PostMapping("/InsertAdmin")
	public ResponseEntity<Map<String, Object>> insertAdmin(@RequestBody AdminVo adminVo) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        adminMapper.LinsertAdmin(adminVo);
	        response.put("success", true);
	    } catch (Exception e) {
	        log.error("Error inserting admin: ", e); // 로그에 예외 메시지 출력
	        response.put("success", false);
	        response.put("message", "관리자 추가 중 오류가 발생했습니다."); // 사용자에게 보일 메시지
	    }
	    return ResponseEntity.ok(response);
	}
    @PostMapping("/GetadminList")
    public ResponseEntity<List<AdminVo>> getAdminList(@RequestBody AdminVo adminVo) {
        try {
            List<AdminVo> adminList = adminMapper.LgetadminListmodal(adminVo);
            return ResponseEntity.ok().body(adminList);

        } catch (Exception e) {
            // 예외 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
	@GetMapping("/GetNewpProid")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getnewpproid() {
	    Integer newAdminId = adminMapper.LgetProId();
	    System.out.println("New Admin ID: " + newAdminId);
	    Map<String, Object> response = new HashMap<>();
	    response.put("success", newAdminId != null);
	    response.put("newAdminId", newAdminId);
	    return ResponseEntity.ok(response);
	}
    @PostMapping("/InsertProduct")
    public ResponseEntity<?> insertProduct(@RequestParam("product") String productStr,
                                           @RequestParam("stock") String stockStr,
                                           @RequestParam("imgFiles") List<MultipartFile> imgFiles) {
        try {
            // JSON 문자열을 Map으로 변환
            Map<String, Object> productData = new ObjectMapper().readValue(productStr, Map.class);
            Map<String, Object> stockData = new ObjectMapper().readValue(stockStr, Map.class);
	        if (productData != null) {
	            ProductVo productVo = new ProductVo();
	            productVo.setPro_id(productData.get("pro_id") != null ? Integer.parseInt(productData.get("pro_id").toString()) : null);
	            productVo.setName((String) productData.get("name"));
	            productVo.setMake_id(productData.get("make_id") != null ? Integer.parseInt(productData.get("make_id").toString()) : null);
	            productVo.setIng_id(productData.get("ing_id") != null ? Integer.parseInt(productData.get("ing_id").toString()) : null);
	            productVo.setUrl((String) productData.get("url"));
	            productVo.setForm_id(productData.get("form_id") != null ? Integer.parseInt(productData.get("form_id").toString()) : null);
	            productVo.setExplain((String) productData.get("explain"));
	            productVo.setCaution((String) productData.get("caution"));
	            productVo.setPrice(productData.get("price") != null ? Integer.parseInt(productData.get("price").toString()) : null);
	            adminMapper.insertProduct(productVo);
	        }

	        if (stockData != null) {
	            StockVo stockVo = new StockVo();
	            stockVo.setPro_id(stockData.get("pro_id") != null ? Integer.parseInt(stockData.get("pro_id").toString()) : null);
	            stockVo.setCount(stockData.get("count") != null ? Integer.parseInt(stockData.get("count").toString()) : null);
	            stockVo.setAdmin_id(stockData.get("admin_id") != null ? Integer.parseInt(stockData.get("admin_id").toString()) : null);
	            stockVo.setState(stockData.get("state") != null ? Integer.parseInt(stockData.get("state").toString()) : null);
	            adminMapper.insertStock(stockVo);
	        }

	         // 업로드된 이미지 저장
            if (imgFiles != null) {
                for (MultipartFile imgFile : imgFiles) {
                    if (!imgFile.isEmpty()) {
                        String originalFilename = imgFile.getOriginalFilename();
                        String filePath = "c:/dev/" + originalFilename;
                        File dest = new File(filePath);
                        imgFile.transferTo(dest);

                        // 파일 경로를 데이터베이스에 저장
                        ImgsVo imgsVo = new ImgsVo();
                        imgsVo.setPro_id(Integer.parseInt(productData.get("pro_id").toString()));
                        imgsVo.setImg(filePath);  // 파일 경로 저장
                        adminMapper.insertImgs(imgsVo);
                    }
                }
            }

            return ResponseEntity.ok().body("Product successfully inserted");
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File upload error: " + e.getMessage());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid number format: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
	
	@DeleteMapping("/AdminUserDelete")
	public ResponseEntity<?> deleteUser(@RequestBody Map<String, Object> payload) {
	    try {
	        int id = Integer.parseInt(payload.get("id").toString());
	        System.out.println("Received ID: " + id); // Log the received ID for debugging
	        adminMapper.deleteById(id);
	        return ResponseEntity.ok().body(Map.of("message", "User deleted successfully"));
	    } catch (Exception e) {
	        e.printStackTrace(); // Log the full stack trace for debugging
	        return ResponseEntity.badRequest().body(Map.of("error", "Error deleting user: " + e.getMessage()));
	    }
	}
	@GetMapping("/GetProductDetails")
	public ResponseEntity<?> getProductDetails(@RequestParam("id") int id) {
	    System.out.println(id); // 확인용 로그
	    ProductVo product = adminMapper.getProductById(id);
	    if (product != null) {
	        return ResponseEntity.ok(Map.of("pro", product));
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	            .body(Map.of("error", "Product not found"));
	    }
	}
	@PutMapping("/UpdateAdmin")
	public ResponseEntity<?> updateAdmin(@RequestBody Map<String, Object> payload) {
	    try {
	        String adminIdStr = (String) payload.get("admin_id");
	        int adminId = Integer.parseInt(adminIdStr);

	        String name = (String) payload.get("name");
	        String id = (String) payload.get("id");
	        String password = (String) payload.get("password");

	        // 데이터베이스 업데이트
	        boolean isUpdated = adminMapper.updateAdminDetails(adminId, name, id, password);

	        if (isUpdated) {
	            return ResponseEntity.ok(Map.of("success", true));
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("error", "데이터 업데이트 실패"));
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	            .body(Map.of("error", "잘못된 adminId 형식: " + e.getMessage()));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	            .body(Map.of("error", "서버 오류: " + e.getMessage()));
	    }
	}
	@DeleteMapping("/DeleteAdmin")
	public ResponseEntity<?> deleteAdmin(@RequestBody Map<String, Object> payload) {
	    try {
	        int id = Integer.parseInt(payload.get("pro_id").toString());
	        adminMapper.deleteAdmin(id);
	        return ResponseEntity.ok().body(Map.of("success", true, "message", "User deleted successfully"));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.badRequest().body(Map.of("success", false, "error", "Error deleting user: " + e.getMessage()));
	    }
	}
	@PostMapping("/InsertMake")
	public ResponseEntity<Map<String, Object>> insertmake(@RequestBody MakeVo makeVo) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        adminMapper.LinsertMake(makeVo);
	        response.put("success", true);
	    } catch (Exception e) {
	        log.error("Error inserting admin: ", e); // 로그에 예외 메시지 출력
	        response.put("success", false);
	        response.put("message", "관리자 추가 중 오류가 발생했습니다."); // 사용자에게 보일 메시지
	    }
	    return ResponseEntity.ok(response);
	}
	@PostMapping("/InsertIng")
	public ResponseEntity<Map<String, Object>> inserting(@RequestBody IngredientVo ingredientVo) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        adminMapper.LinsertIng(ingredientVo);
	        response.put("success", true);
	    } catch (Exception e) {
	        log.error("Error inserting admin: ", e); // 로그에 예외 메시지 출력
	        response.put("success", false);
	        response.put("message", "관리자 추가 중 오류가 발생했습니다."); // 사용자에게 보일 메시지
	    }
	    return ResponseEntity.ok(response);
	}
	
	@PostMapping("/Insertform")
	public ResponseEntity<Map<String, Object>> insertform(@RequestBody FormVo formVo) {
		Map<String, Object> response = new HashMap<>();
		try {
			adminMapper.LinsertForm(formVo);
			response.put("success", true);
		} catch (Exception e) {
			log.error("Error inserting admin: ", e); // 로그에 예외 메시지 출력
			response.put("success", false);
			response.put("message", "관리자 추가 중 오류가 발생했습니다."); // 사용자에게 보일 메시지
		}
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/InsertNut")
	public ResponseEntity<Map<String, Object>> insertnut(@RequestBody NutrientVo nutrientVo) {
		Map<String, Object> response = new HashMap<>();
		try {
			adminMapper.LinsertNut(nutrientVo);
			response.put("success", true);
		} catch (Exception e) {
			log.error("Error inserting admin: ", e); // 로그에 예외 메시지 출력
			response.put("success", false);
			response.put("message", "관리자 추가 중 오류가 발생했습니다."); // 사용자에게 보일 메시지
		}
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/GetMakeList")
	public ResponseEntity<List<MakeVo>> getmakelist(@RequestBody MakeVo makeVo) {
	    try {
	        List<MakeVo> makeList = adminMapper.LgetMakeListmodal(makeVo);
	        return ResponseEntity.ok().body(makeList);
	    } catch (Exception e) {
	        // 예외 처리
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
	@PutMapping("/UpdateMake") // PUT 메서드로 변경
	public ResponseEntity<?> updateMake(@RequestBody Map<String, Object> payload) {
	    try {
	        Object makeIdObj = payload.get("make_id");
	        int make_id;

	        if (makeIdObj instanceof Integer) {
	            make_id = (Integer) makeIdObj;
	        } else if (makeIdObj instanceof String) {
	            make_id = Integer.parseInt((String) makeIdObj);
	        } else {
	            throw new IllegalArgumentException("make_id의 형식이 잘못되었습니다.");
	        }

	        String name = (String) payload.get("name");
	        String tel = (String) payload.get("tel");
	        String zipcode = (String) payload.get("zipcode");
	        String address = (String) payload.get("address");
	        String addressdetail = (String) payload.get("addressdetail");

	        // 데이터베이스 업데이트
	        boolean isUpdated = adminMapper.updateMakeDetails(make_id, name, tel, zipcode, address, addressdetail);

	        if (isUpdated) {
	            return ResponseEntity.ok(Map.of("success", true));
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("error", "데이터 업데이트 실패"));
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	            .body(Map.of("error", "잘못된 make_id 형식: " + e.getMessage()));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	            .body(Map.of("error", "서버 오류: " + e.getMessage()));
	    }
	}
	@DeleteMapping("/DeleteMake")
	public ResponseEntity<?> deletemake(@RequestBody Map<String, Object> payload) {
	    try {
	        Object makeIdObj = payload.get("make_id");
	        int make_id;

	        if (makeIdObj instanceof Integer) {
	            make_id = (Integer) makeIdObj;
	        } else if (makeIdObj instanceof String) {
	            make_id = Integer.parseInt((String) makeIdObj);
	        } else {
	            throw new IllegalArgumentException("make_id의 형식이 잘못되었습니다.");
	        }
	        adminMapper.deleteMake(make_id);
	        return ResponseEntity.ok().body(Map.of("success", true, "message", "User deleted successfully"));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.badRequest().body(Map.of("success", false, "error", "Error deleting user: " + e.getMessage()));
	    }
	}
	@PostMapping("/GetIngList")
	public ResponseEntity<List<IngredientVo>> getinglist(@RequestBody IngredientVo ingredientVo) {
	    try {
	        List<IngredientVo> ingList = adminMapper.LgetIngListmodal(ingredientVo);
	        return ResponseEntity.ok().body(ingList);
	    } catch (Exception e) {
	        e.printStackTrace(); // Add this line to log the exception details
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
	@PutMapping("/UpdateIng") // PUT 메서드로 변경
	public ResponseEntity<?> UpdateIng(@RequestBody Map<String, Object> payload) {
	    try {
	        Object makeIdObj = payload.get("ing_id");
	        int ing_id;

	        if (makeIdObj instanceof Integer) {
	        	ing_id = (Integer) makeIdObj;
	        } else if (makeIdObj instanceof String) {
	        	ing_id = Integer.parseInt((String) makeIdObj);
	        } else {
	            throw new IllegalArgumentException("make_id의 형식이 잘못되었습니다.");
	        }

	        String name = (String) payload.get("name");

	        // 데이터베이스 업데이트
	        boolean isUpdated = adminMapper.updateIngDetails(ing_id, name);

	        if (isUpdated) {
	            return ResponseEntity.ok(Map.of("success", true));
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("error", "데이터 업데이트 실패"));
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	            .body(Map.of("error", "잘못된 make_id 형식: " + e.getMessage()));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	            .body(Map.of("error", "서버 오류: " + e.getMessage()));
	    }
	}
	
	@PostMapping("/MonthlyButton")
	public ResponseEntity<List<StockVo>> monthlybutton(@RequestBody StockVo stockVo) {
	    try {
	        List<StockVo> stockList = adminMapper.LgetMonthbutton(stockVo);
	        return ResponseEntity.ok().body(stockList);
	    } catch (Exception e) {
	        e.printStackTrace(); // Add this line to log the exception details
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	@PostMapping("/AllDayButton")
	public ResponseEntity<List<StockVo>> alldaybutton(@RequestBody StockVo stockVo) {
	    try {
	        List<StockVo> stockList = adminMapper.LgetStockList(stockVo);
	        return ResponseEntity.ok().body(stockList);
	    } catch (Exception e) {
	        e.printStackTrace(); // Add this line to log the exception details
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	@PostMapping("/WeekButton")
	public ResponseEntity<List<StockVo>> weekbutton(@RequestBody StockVo stockVo) {
		try {
			List<StockVo> stockList = adminMapper.LgetWeekbutton(stockVo);
			return ResponseEntity.ok().body(stockList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@PostMapping("/DailyButton")
	public ResponseEntity<List<StockVo>> dailybutton(@RequestBody StockVo stockVo) {
		try {
			List<StockVo> stockList = adminMapper.LgetDailybutton(stockVo);
			return ResponseEntity.ok().body(stockList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@PostMapping("/checkBanButton")
	public ResponseEntity<List<PostVo>> checkbanbutton(@RequestBody PostVo postVo) {
		try {
			List<PostVo> repostList = adminMapper.LgetReportList(postVo);
			return ResponseEntity.ok().body(repostList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@PostMapping("/allReportButton")
	public ResponseEntity<List<ReportVo>> allreportbutton(@RequestBody ReportVo reportVo) {
		try {
			List<ReportVo> stockList = adminMapper.LgetallButtonReportList(reportVo);
			return ResponseEntity.ok().body(stockList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@PostMapping("/banUserButton")
	public ResponseEntity<List<BenVo>> banuserbutton(@RequestBody BenVo benVo) {
		try {
			List<BenVo> benList = adminMapper.LgetBenList(benVo);
			return ResponseEntity.ok().body(benList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@PostMapping("/GetModalProList")
	public ResponseEntity<List<ProductVo>> getmodalprolist(@RequestBody ProductVo productVo) {
		try {
			List<ProductVo> benList = adminMapper.LgetmodalproductList(productVo);
			return ResponseEntity.ok().body(benList);
		} catch (Exception e) {
			e.printStackTrace(); // Add this line to log the exception details
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	@PutMapping("/UpdatePro")
	public ResponseEntity<?> UpdatePro(@RequestBody Map<String, Object> payload) {
	    try {
	        int pro_id = Integer.parseInt(payload.get("pro_id").toString());
	        String name = payload.get("name").toString();
	        String make_name = payload.get("make_name").toString();
	        String ing_name = payload.get("ing_name").toString();
	        String url = payload.get("url").toString();
	        String type = payload.get("type").toString();
	        String explain = payload.get("explain").toString();
	        String caution = payload.get("caution").toString();
	        int price = Integer.parseInt(payload.get("price").toString());
	        int count = Integer.parseInt(payload.get("count").toString());
	        String admin_name = payload.get("admin_name").toString();

	        // 데이터베이스 업데이트
	        boolean isUpdated = adminMapper.updateProdModal(pro_id, name, make_name, ing_name, url, type, explain, caution, price);
	        boolean isInsert = adminMapper.insertProMoadl(pro_id, admin_name, count);

	        if (isUpdated || isInsert) {
	            return ResponseEntity.ok(Map.of("success", true));
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("error", "데이터 업데이트 실패"));
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	            .body(Map.of("error", "잘못된 형식의 숫자: " + e.getMessage()));
	    } catch (IllegalArgumentException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	            .body(Map.of("error", e.getMessage()));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	            .body(Map.of("error", "서버 오류: " + e.getMessage()));
	    }
	}

}
