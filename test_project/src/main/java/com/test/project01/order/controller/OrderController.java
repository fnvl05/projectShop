package com.test.project01.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.order.dto.OrdersDto;
import com.test.project01.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService service;
	
	@RequestMapping("/shop/orderform")
	public ModelAndView getList(HttpServletRequest request,ModelAndView mView) {
		
		mView.setViewName("shop/orderform");
		return mView;
	}
	
	@RequestMapping(value="/shop/order",method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request,ModelAndView mView,
			@ModelAttribute("dto") OrdersDto dto) {
		service.insert(request, dto);
		mView.setViewName("shop/order");
		return mView;
	}
	
	
}
