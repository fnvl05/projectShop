package com.test.project01.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.cart.dto.CartListDto;

@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void addCart(CartListDto dto) {
		session.insert("cart.addCart", dto);
	}

	@Override
	public List<CartListDto> cartList(String userId) {
		return session.selectList("cart.cartList", userId);
	}

	@Override
	public void deleteCart(int cartNum) {
		session.delete("cart.deleteCart", cartNum);
	}

	
}
