package com.test.project01.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project01.cart.dao.CartDao;
import com.test.project01.cart.dto.CartListDto;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao dao;

	@Override
	public void addCart(CartListDto dto) {
		dao.addCart(dto);
	}

	@Override
	public List<CartListDto> cartList(String userId) {
		return dao.cartList(userId);
	}
	
	
}
