package com.vita.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {

	@GetMapping("/Item/View")
	public ModelAndView ItemView() {
		
		 ModelAndView mv = new ModelAndView();
		 
		 
		 
		 mv.setViewName("item/view");
		 return mv;
	}
}
