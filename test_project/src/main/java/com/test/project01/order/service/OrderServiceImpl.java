package com.test.project01.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project01.order.dao.OrderDao;
import com.test.project01.order.dao.OrderDetailDao;
import com.test.project01.order.dto.OrderDetailJoinDto;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao dao;
	@Autowired
	OrderDetailDao detailDao;

	@Override
	public void detailList(HttpServletRequest request) {
		OrderDetailJoinDto dto=new OrderDetailJoinDto();
		List<OrderDetailJoinDto> list=detailDao.getList();
		request.setAttribute("list", list);
	}
	    
}
 