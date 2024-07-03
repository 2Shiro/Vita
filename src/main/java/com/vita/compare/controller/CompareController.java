package com.vita.compare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CompareController {
	
	@GetMapping("/Compare/View")
	public ModelAndView CompareView(HttpServletRequest request) {
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("compare/view");
		
		return mv;
	}
	

}
