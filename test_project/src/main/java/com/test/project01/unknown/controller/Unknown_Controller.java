package com.test.project01.unknown.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.service.Unknown_service;

@Controller
public class Unknown_Controller {
	
	@Autowired
	Unknown_service serviec;
	
	@RequestMapping("/Unknown/itemList")
	public ModelAndView itemList(ModelAndView mView, HttpServletRequest request) {
		serviec.itemList(mView);
		mView.setViewName("Unknown/itemList");
		return mView;
	}
}
