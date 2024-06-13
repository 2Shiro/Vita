package com.vita.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.admin.domain.AdminVo;
import com.vita.admin.domain.FormVo;
import com.vita.admin.domain.IngredientVo;
import com.vita.admin.domain.MakeVo;
import com.vita.admin.domain.NutrientVo;
import com.vita.admin.domain.ProductVo;
import com.vita.admin.mapper.AdminMapper;
import com.vita.oauth.domain.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	AdminMapper adminMapper;
	
	@RequestMapping("/9000")
	public String adminhome(){
		return "admin/adminLogin";
	}
	@RequestMapping("/AdminHome")
	public ModelAndView adminhome1(UserVo userVo){
	        List<UserVo> totalUsers = adminMapper.getAllUsers(userVo);
			ModelAndView   mv   =  new  ModelAndView();
			System.out.println("333333333333"  + userVo);
	        mv.addObject("totalUsers", totalUsers);
	        mv.setViewName("admin/adminHome");
	        return mv;
	    }
	

	@RequestMapping("/AdminLogin")
	public ModelAndView adminLogin(HttpServletRequest request) {
		String id  = request.getParameter("id");
		String password  = request.getParameter("password");
		System.out.println("1111111111111111111" + id);
		System.out.println("2222222222222222222" + password);
		
		AdminVo adminVo = adminMapper.LadminLogin( id, password );
		String loc          = "";
		//아이디 암호가 일치하면
			if(  adminVo != null  ) { // 아이디와 암호가 일치하면
				HttpSession  session =  request.getSession();
				session.setAttribute("login", adminVo );
				loc    =  "admin/adminHome";  
			} else {  // 아이디 비번 틀림
				loc    =  "redirect:/9000"; 
			}
			ModelAndView   mv   =  new  ModelAndView();
			mv.setViewName( loc );
			return mv;
	}
	@RequestMapping("/AdminLogout")
	public   String   adminlogout(  HttpSession  session    ) {
		session.invalidate();
		return  "admin/adminLogin";
	}
	
	@RequestMapping("/AdminList")
	public ModelAndView admininfo(AdminVo adminVo){
        List<AdminVo> adminList = adminMapper.LgetadminList(adminVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("adminList", adminList);
        mv.setViewName("admin/adminList");
        return mv;
	}
	@RequestMapping("/AdminProduct")
	public ModelAndView adminproduct(ProductVo productVo, MakeVo makeVo, IngredientVo ingredientVo, FormVo formVo){
		List<ProductVo> productList = adminMapper.LgetproductList(productVo);
		List<MakeVo> makeList = adminMapper.LgetProdModalMakeList(makeVo);
		List<IngredientVo> ingredientLst = adminMapper.LgetingList(ingredientVo);
		List<FormVo> formList = adminMapper.LgetFormList(formVo);
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("productList", productList);
		mv.addObject("makeList", makeList);
		mv.addObject("ingList", ingredientLst);
		mv.addObject("formList", formList);
        mv.setViewName("admin/adminProduct");
		return mv;
	}
	@RequestMapping("/AdminUserList")
	public ModelAndView adminuserlist(UserVo userVo){
        List<UserVo> userList = adminMapper.LgetUserList(userVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("userList", userList);
        mv.setViewName("admin/adminUserList");
        return mv;
	}
	@RequestMapping("/MakeList")
	public ModelAndView makelist(MakeVo makeVo){
        List<MakeVo> makeList = adminMapper.LgetMakeList(makeVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("makeList", makeList);
        mv.setViewName("admin/makeList");
        return mv;
	}
	@RequestMapping("/Ingredient")
	public ModelAndView ingredient(IngredientVo ingredientVo){
        List<IngredientVo> ingList = adminMapper.LgetingList(ingredientVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("ingList", ingList);
        mv.setViewName("admin/ingredient");
        return mv;
	}
	@RequestMapping("/FormList")
	public ModelAndView formlist(FormVo formVo){
		List<FormVo> formList = adminMapper.LgetFormList(formVo);
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("formList", formList);
		mv.setViewName("admin/form");
		return mv;
	}
	@RequestMapping("/NutrientList")
	public ModelAndView nutrientlist(NutrientVo nutrientVo, ProductVo productVo, IngredientVo ingredientVo ){
		List<NutrientVo> nutrientList = adminMapper.LgetNutrientList(nutrientVo);
		List<ProductVo> productList = adminMapper.LgetproductList(productVo);
        List<IngredientVo> ingList = adminMapper.LgetingList(ingredientVo);
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("nutrienList", nutrientList);
		mv.addObject("productList", productList);
		mv.addObject("ingList", ingList);
		mv.setViewName("admin/nutrientList");
		return mv;
	}
}
