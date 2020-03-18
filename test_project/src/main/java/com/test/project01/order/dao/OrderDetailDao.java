package com.test.project01.order.dao;

import java.util.List;

import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;

public interface OrderDetailDao {
	public List<OrderDetailJoinDto> getList();
}
