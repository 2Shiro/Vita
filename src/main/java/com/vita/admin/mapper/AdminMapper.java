package com.vita.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vita.admin.domain.AdminVo;
import com.vita.admin.domain.FormVo;
import com.vita.admin.domain.ImgsVo;
import com.vita.admin.domain.IngredientVo;
import com.vita.admin.domain.MakeVo;
import com.vita.admin.domain.NutrientVo;
import com.vita.admin.domain.ProductVo;
import com.vita.admin.domain.StockVo;
import com.vita.oauth.domain.UserVo;

@Mapper
public interface AdminMapper {

	AdminVo LadminLogin(String id, String password);

	List<AdminVo> LgetadminList(AdminVo adminVo);

	List<ProductVo> LgetproductList(ProductVo productVo);

	void LinsertAdmin(AdminVo adminVo);

	Integer LgetadminId();

	List<AdminVo> LgetadminListmodal(AdminVo adminVo);

	Integer LgetProId();


	List<UserVo> LgetUserList(UserVo userVo);

	void deleteById(int id);

	ProductVo getProductById(int id);

	boolean updateAdminDetails(int adminId, String name, String id, String password);

	void deleteAdmin(int id);

	List<UserVo> getAllUsers(UserVo userVo);

	void insertProduct(ProductVo productVo);

	void insertStock(StockVo stockVo);

	void insertImgs(ImgsVo imgsVo);

	List<MakeVo> LgetMakeList(MakeVo makeVo);

	void LinsertMake(MakeVo makeVo);

	List<IngredientVo> LgetingList(IngredientVo ingredientVo);

	void LinsertIng(IngredientVo ingredientVo);

	List<FormVo> LgetFormList(FormVo formVo);

	void LinsertForm(FormVo formVo);

	List<NutrientVo> LgetNutrientList(NutrientVo nutrientVo);

	void LinsertNut(NutrientVo nutrientVo);

	List<MakeVo> LgetMakeListmodal(MakeVo makeVo);

	boolean updateMakeDetails(int make_id, String name, String tel, String zipcode, String address,
			String addressdetail);

	void deleteMake(int make_id);

	List<IngredientVo> LgetIngListmodal(IngredientVo ingredientVo);

	boolean updateIngDetails(int ing_id, String name);

	List<MakeVo> LgetProdModalMakeList(MakeVo makeVo);


















}
