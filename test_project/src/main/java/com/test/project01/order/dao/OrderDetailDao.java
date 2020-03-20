package com.test.project01.order.dao;

import java.util.List;

import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;
import com.test.project01.order.dto.OrdersDto;

public interface OrderDetailDao {
	public List<OrderDetailJoinDto> getList(String userId);
	public void detailInsert(OrderDetailDto dto);
}
