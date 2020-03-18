package com.test.project01.cart.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.cart.dto.CartListDto;
import com.test.project01.cart.service.CartService;
import com.test.project01.users.Dto.UsersDto;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	//장바구니 추가
	@RequestMapping("/shop/addCart")
	public String addCart(CartListDto dto, HttpSession session) {
		
		//UsersDto user=(UsersDto)session.getAttribute("userDto");
		//dto.setUserId(user.getUserId());
		String userId=(String)session.getAttribute("userId");
		dto.setUserId(userId);
		//장바구니에 기존 상품 있나 검사
		int count=service.countCart(dto.getItemNum(), userId);
		if(count ==0) {
			//없으면 추가
			service.addCart(dto);
		}else {
			//있으면 update
			service.updateCart(dto);
		}
		return "redirect:/cartList.do";
	}
	
	//2. 장바구니 목록
	@RequestMapping("/shop/cartList")
	public void getCartList(HttpSession session, Model model) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();
		
		List<CartListDto> cartList=service.cartList(userId);
		model.addAttribute("cartList", cartList);
	}

	//3. 장바구니 삭제
	@RequestMapping("/shop/deleteCart")
	public String deleteCart(@RequestParam int cartNum) {
		service.deleteCart(cartNum);
		return "redirect:cartList.do";
	}
	
	//4. 장바구니 수정
	@RequestMapping("/shop/updateCart")
	public String updateCart(@RequestParam int[] cartStock, @RequestParam int[] itemNum,
			HttpSession session) {
		//session 아이디
		String userId=(String)session.getAttribute("userId");
		//레코드의 갯수만큼 반복문 실행
		for(int i=0; i<itemNum.length; i++) {
			CartListDto dto=new CartListDto();
			dto.setUserId(userId);
			dto.setCartStock(cartStock[i]);
			dto.setItemNum(itemNum[i]);
			service.modifyCart(dto);
		}
		return "redirect:cartList.do";
		
	}
}


