package com.test.project01.cart.dao;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;


public interface CartDao {
	//1.장바구니 추가
	public void addCart(CartListDto dto);
	//2.장바구니 목록보기
	public List<CartListDto> cartList(String userId);
	//3.장바구니 삭제
	public void deleteCart(int cartNum);
	//4.장바구니 수정
	public void modifyCart(CartListDto dto);
	//5.장바구니 동일 상품 확인
	public int countCart(int itemNum, String userId);
	//6.장바구니 상품수량 변경
	public void updateCart(CartListDto dto);
	//7.장바구니 금액 합계
	public int sumMoney(String userId);
}
