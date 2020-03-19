package com.test.project01.order.service;

import javax.servlet.http.HttpServletRequest;

import com.test.project01.order.dto.OrdersDto;

public interface OrderService {
	public void detailList(HttpServletRequest request);
	public void insert(HttpServletRequest request,OrdersDto dto);
}
