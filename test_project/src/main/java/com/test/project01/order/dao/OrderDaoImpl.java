package com.test.project01.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.order.dto.OrdersDto;

@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	SqlSession session;

	@Override
	public void insert(OrdersDto dto) {
		session.insert("order.insert",dto);
	}
	
}
