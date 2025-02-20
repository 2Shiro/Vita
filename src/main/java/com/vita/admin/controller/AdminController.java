package com.vita.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.admin.domain.AdminVo;
import com.vita.admin.domain.FormVo;
import com.vita.admin.domain.IngredientVo;
import com.vita.admin.domain.InquiryVo;
import com.vita.admin.domain.MakeVo;
import com.vita.admin.domain.NutrientVo;
import com.vita.admin.domain.PostVo;
import com.vita.admin.domain.ProductVo;
import com.vita.admin.domain.RefundVo;
import com.vita.admin.domain.ReportVo;
import com.vita.admin.domain.StockVo;
import com.vita.admin.mapper.AdminMapper;
import com.vita.oauth.domain.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.Locale;

@Controller
public class AdminController {
	
	@Autowired
	AdminMapper adminMapper;
	
	@RequestMapping("/9000")
	public String adminhome(){
		return "admin/adminLogin";
	}
	@RequestMapping("/AdminHome")
	public ModelAndView adminhome1(UserVo userVo, ProductVo productVo, StockVo stockVo) {
	    int totalUsers = adminMapper.getAllUsers(userVo);
	    int totalAmount = adminMapper.getTotalAmount(productVo);
        List<StockVo> stockList = adminMapper.LgetStockList(stockVo);
	    NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
	    String formattedTotalAmount = numberFormat.format(totalAmount);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("totalUsers", totalUsers);
	    mv.addObject("totalAmount", formattedTotalAmount); 
	    mv.addObject("stockList", stockList); 
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
	@RequestMapping("/Inquiry")
	public ModelAndView inquiry(InquiryVo inquiryVo){
		List<InquiryVo> inquiryList = adminMapper.LgetinquiryList(inquiryVo);
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("inquiryList", inquiryList);
		mv.setViewName("admin/inquiryList");
		return mv;
	}
	@RequestMapping("/ReportList")
	public ModelAndView reportlist(ReportVo reporttVo ){
        List<ReportVo> reportList = adminMapper.LcgetReportList(reporttVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("reportList", reportList);
        mv.setViewName("admin/reportList");
        return mv;
	}
	
}
