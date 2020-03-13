package com.test.project01.cart.dao;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;


public interface CartDao {
	public void addCart(CartListDto dto);
	public List<CartListDto> cartList(String userId);

}
