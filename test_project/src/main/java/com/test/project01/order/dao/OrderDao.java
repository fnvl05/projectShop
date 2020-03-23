package com.test.project01.order.dao;


import java.util.List;

import com.test.project01.order.dto.OrdersDto;

public interface OrderDao {
	public List<Integer> getOrderNum(String userId);
	public void insert(OrdersDto dto);
	public List<OrdersDto> orderInfo(OrdersDto dto);
}
