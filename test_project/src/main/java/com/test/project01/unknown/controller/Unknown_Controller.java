package com.test.project01.unknown.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.unknown.service.Unknown_service;

@Controller
public class Unknown_Controller {
	
	@Autowired
	Unknown_service serviec;
	
	@RequestMapping("/Unknown/itemAllList")
	public ModelAndView itemList(ModelAndView mView, HttpServletRequest request) {
		serviec.itemList(mView);
		mView.setViewName("Unknown/itemAllList");
		return mView;
	}
	@RequestMapping("/Unknown/itemView_form")
	public ModelAndView itemView_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView) {
		serviec.getItemView(mView, itemNum);
		mView.setViewName("Unknown/itemView_form");
		return mView;
	}
	@RequestMapping("/Unknown/itemList")
	public ModelAndView getCateList(@RequestParam int cateCode, @RequestParam int cateLevel, ModelAndView mView) {
		List<Unknown_itemDto> cateList = null;
		cateList = serviec.cateList(cateCode, cateLevel);
		mView.addObject("cateList", cateList);
		mView.setViewName("Unknown/itemList");
		return mView;
	}
}
