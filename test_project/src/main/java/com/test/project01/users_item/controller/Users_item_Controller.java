package com.test.project01.users_item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.unknown.service.Unknown_service;

@Controller
public class Users_item_Controller {
	
	@Autowired
	Unknown_service serviec;
	
	@RequestMapping("/Users_Item/itemAllList")
	public ModelAndView itemList(ModelAndView mView, HttpServletRequest request) {
		serviec.itemList(mView);
		mView.setViewName("Users_Item/itemAllList");
		return mView;
	}
	@RequestMapping("/Users_Item/itemView_form")
	public ModelAndView itemView_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView) {
		serviec.getItemView(mView, itemNum);
		mView.setViewName("Users_Item/itemView_form");
		return mView;
	}
	@RequestMapping("/Users_Item/itemList")
	public ModelAndView getCateList(@RequestParam int cateCode, @RequestParam int cateLevel, ModelAndView mView) {
		List<Unknown_itemDto> cateList = null;
		cateList = serviec.cateList(cateCode, cateLevel);
		mView.addObject("cateList", cateList);
		mView.setViewName("Users_Item/itemList");
		return mView;
	}
}
