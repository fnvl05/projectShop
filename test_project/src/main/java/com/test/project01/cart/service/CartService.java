package com.test.project01.cart.service;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;

public interface CartService {
	//장바구니 추가
	public void addCart(CartListDto dto);
	//장바구니 목록
	public List<CartListDto> cartList(String userId);
	//장바구니 삭제
	public void deleteCart(CartListDto dto);
}
