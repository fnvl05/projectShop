package com.test.project01.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dto.UsersDto;
import com.test.project01.users.serevice.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@RequestMapping("/Users/signup_form")
	public String signup_form() {
		return "Users/signup_form";
	}
	
	@RequestMapping(value = "/Users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto,
			ModelAndView mView) {
		service.addUser(dto);
		mView.setViewName("Users/insert");
		return mView;
	}
	
	@RequestMapping("Users/login_form")
	public String logInForm(HttpServletRequest request) {	
		return "Users/login_form";
	}
	
	@RequestMapping(value = "/Users/login", method = RequestMethod.POST)
	public ModelAndView logIn(@ModelAttribute UsersDto dto, 
			ModelAndView mView, HttpServletRequest request, HttpServletResponse response) {
		if(service.validUsers(dto, request.getSession(), mView)) {
			mView.setViewName("home");
			return mView;			
		}else {
			mView.setViewName("/Users/login_form");
			return mView;
		}
		
	}
	@RequestMapping("Users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}

	
	
	
	
	
	
	
}
