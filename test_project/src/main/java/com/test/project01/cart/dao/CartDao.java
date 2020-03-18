package com.test.project01.cart.dao;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;


public interface CartDao {
	//카트 추가하기
	public void addCart(CartListDto dto);
	//카트리스트 보기
	public List<CartListDto> cartList(String userId);
	//카트에서 삭제하기
	public void deleteCart(int cartNum);
	
}
