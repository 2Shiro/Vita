package com.vita.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vita.controller.GetUserIdService;
import com.vita.pay.domain.DeliveryVo;
import com.vita.pay.domain.ImgsVo;
import com.vita.pay.domain.ProdVo;
import com.vita.pay.mapper.PayMapper;
import com.vita.user.domain.GoodsVo;
import com.vita.user.domain.PayResultVo;
import com.vita.user.domain.PayVo;
import com.vita.user.mapper.UsersMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsersController {
	 
	@Autowired
	private GetUserIdService getUserIdService;
	
	@Autowired
	private PayMapper payMapper;
	
	@Autowired
	private UsersMapper usersMapper;
	
	// 장바구니 화면 출력
	@GetMapping("/Mypage")
	public ModelAndView basket(HttpServletRequest request) {

	    Long id = getUserIdService.getId(request);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    // 결제 목록 가져오기
	    List<PayResultVo> payResultList = new ArrayList<>();
	    List<GoodsVo> GoodsList = usersMapper.getGoodsList(id);

	    // 다중 Pay_id 값을 처리하도록 usersMapper.getPay 메서드 호출
	    List<PayVo> payList = usersMapper.getPay(id);
	    
	    for (GoodsVo goodsvo : GoodsList) {
	        
	        ProdVo prodvo = payMapper.getProd(goodsvo.getPro_id());
	        
	        ImgsVo imgsvo = payMapper.getImg(goodsvo.getPro_id());
	        
	        PayVo payvo = usersMapper.getIdentity(goodsvo.getPay_id());
	        
	        PayResultVo payresultvo = new PayResultVo(
	        	goodsvo.getGoods_id(),
	        	goodsvo.getPro_id(),
	        	payvo.getIdentity(),
	            imgsvo.getImg_id(),
	            imgsvo.getImg(),
	            prodvo.getUrl(),
	            prodvo.getName(),
	            goodsvo.getPrice(),
	            goodsvo.getCount(),
	            goodsvo.getState()
	        );
	        
	        payResultList.add(payresultvo);
	    }

	    // 기본 배송지 가져오기
	    DeliveryVo deliveryvo = payMapper.getDeliveryDefualt(id);
	    
	    // 배송지 목록 가져오기
	    List<DeliveryVo> deliveryList = payMapper.getDeliveryList(id);
	    
	    mv.addObject("GoodsList", GoodsList);
	    mv.addObject("payResultList", payResultList);
	    mv.addObject("payList", payList);
	    mv.addObject("deliveryvo", deliveryvo);
	    mv.addObject("deliveryList", deliveryList);
	    mv.addObject("id", id);
	    mv.setViewName("user/mypage");
	    
	    return mv;
	}

}
