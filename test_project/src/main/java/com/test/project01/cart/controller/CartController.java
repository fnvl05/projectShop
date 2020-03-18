package com.test.project01.cart.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMethod;
=======
>>>>>>> refs/heads/yun
import org.springframework.web.bind.annotation.RequestParam;

import com.test.project01.cart.dto.CartListDto;
import com.test.project01.cart.service.CartService;
import com.test.project01.users.Dto.UsersDto;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	//장바구니 추가
	@RequestMapping(value = "/Users_Item/cart", method = RequestMethod.POST)
	public String addCart(@ModelAttribute("dto") CartListDto dto, HttpSession session) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		dto.setUserId(user.getUserId());
		
		service.addCart(dto);

		return "redirect:/cartList.do";
	}
	
	@RequestMapping("/shop/cartList")
	public void getCartList(HttpSession session, Model model) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();
		
		List<CartListDto> cartList=service.cartList(userId);
		model.addAttribute("cartList", cartList);
	}

	@RequestMapping("/shop/deleteCart")
	public String deleteCart(@RequestParam int cartNum) {
		service.deleteCart(cartNum);
		return "redirect:cartList.do";
	}
}


