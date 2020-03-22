package com.test.project01.order.dao;

import java.util.List;

import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;
import com.test.project01.order.dto.OrdersDto;

public interface OrderDetailDao {

	public void detailInsert(OrderDetailDto dto);
	//전체 리스트
	public List<OrderDetailJoinDto> getList(OrderDetailJoinDto dto);
	
}
