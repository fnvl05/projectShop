package com.test.project01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping("/home.do")
	public String home(HttpServletRequest request) {
	return "home";
	}
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request) {
	return "index";
	}
	
}
