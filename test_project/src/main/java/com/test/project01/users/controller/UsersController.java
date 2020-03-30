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
	
	// 회원가입
	@RequestMapping("/Users/signup_form")
	public String signup_form() {
		return "Users/signup_form";
	}
	
	@RequestMapping(value="/Users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto, 
			ModelAndView mView) {
		service.addUser(dto);
		mView.setViewName("index");
		return mView;
	}
	
	// 로그인
	@RequestMapping("/Users/login_form")
	public String logInForm(HttpServletRequest request) {
		return "Users/login_form";
	}
	
	@RequestMapping(value ="/Users/login", method = RequestMethod.POST)
	public ModelAndView logIn(@ModelAttribute UsersDto dto,
			ModelAndView mView, HttpServletRequest request, 
			HttpServletResponse response) {
		boolean test=service.validUsers(dto, request.getSession(), mView);
		if(test) {
			mView.setViewName("index");
			return mView;
		} else {
			mView.setViewName("Users/login_form");
			return mView;
		}
	}
	
	// 로그아웃
	@RequestMapping("Users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	
	// 개인 정보 보기 요청 처리
	@RequestMapping("Users/info")
	public ModelAndView authInfo(HttpServletRequest request, 
				ModelAndView mView) {
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
		
		//UsersService 객체를 이용해서 개인정보를 ModelAndView 객체에 담기도록 한다.
		service.showInfo(id, mView);
		//view page 정보를 담고 
		mView.setViewName("Users/info");
		return mView;//ModelAndView 객체를 리턴해주기 
	}
	
	
	// 비밀번호 수정하고 폼 요청 처리
	@RequestMapping("/Users/newPassform")
	public ModelAndView passForm(HttpServletRequest request, 
			ModelAndView mView) {
		mView.setViewName("Users/newPassform");
		return mView;
	}
	
	@RequestMapping(value="/Users/newPass", method=RequestMethod.POST)
	public ModelAndView passUpdate(HttpServletRequest request,
			ModelAndView mView,HttpSession session,@ModelAttribute UsersDto dto) {
		UsersDto test=(UsersDto)session.getAttribute("usersDto");
		dto.setUserId(test.getUserId());
		System.out.println(dto.getNewPass());
		service.updatePass(dto, mView);
		
		mView.setViewName("/Users/newPass");
		return mView;
	}
	
	// 개인정보 수정 폼 요청
	@RequestMapping("Users/updateform")
	public ModelAndView updateForm(HttpServletRequest request,
			ModelAndView mView) {
		
		String id=(String)request.getSession().getAttribute("id");
		service.showInfo(id, mView);
		mView.setViewName("Users/updateform");
		return mView;	
	}
	
	@RequestMapping(value="Users/update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute UsersDto dto,
			HttpServletRequest request,HttpSession session) {
		UsersDto test=(UsersDto)session.getAttribute("userDto");
		dto.setUserId(test.getUserId());
		service.userUpdate(dto);
		return new ModelAndView("/Users/info");
	}
	
	// 회원탈퇴
	@RequestMapping("Users/delete")
	public ModelAndView delete(HttpServletRequest request,
			ModelAndView mView) {
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");
		// 회원 정보 삭제
		service.deleteUser(id);
		//로그아웃 처리
		session.invalidate();
		
		mView.addObject("id", id);
		mView.setViewName("Users/delete");
		return mView;
	}
	
}
