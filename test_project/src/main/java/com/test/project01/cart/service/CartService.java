package com.test.project01.cart.service;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;

public interface CartService {
	//장바구니 추가
	public void addCart(CartListDto dto);
	//장바구니 목록
	public List<CartListDto> cartList(String userId);
	//장바구니 삭제
	public void deleteCart(int cartNum);
	//장바구니 수정
	public void modifyCart(CartListDto dto);
	//장바구니 상품 확인
	public int countCart(int itemNum, String userId);
	//장바구니 상품 수량 변경
	public void updateCart(CartListDto dto);
<<<<<<< HEAD
=======
	//장바구니 금액 합계
	public int sumMoney(String userId);
>>>>>>> refs/remotes/origin/yun2
}
