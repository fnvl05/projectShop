package com.test.project01.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.project01.cart.dao.CartDao;
import com.test.project01.cart.dto.CartListDto;
import com.test.project01.master.category.Dao.categoryDao;
import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.order.dao.OrderDao;
import com.test.project01.order.dao.OrderDetailDao;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao dao;
	@Autowired
	OrderDetailDao detailDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	categoryDao categoryDao;
	
	@Override
	public void detailList(HttpServletRequest request) {
		OrderDetailJoinDto dto=new OrderDetailJoinDto();
		List<OrderDetailJoinDto> list=detailDao.getList();
		request.setAttribute("list", list);
	}
	
	@Override
	public void cartList_insertform(HttpServletRequest request) {
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		List<CartListDto> list=cartDao.cartList(userId);
		request.setAttribute("list", list);

	}	
	
	@Transactional
	@Override
	public void insert(HttpServletRequest request, OrdersDto dto) {
		//주문 정보 저장
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		String orderRec=request.getParameter("orderRec");
		String orderPhone1=request.getParameter("orderPhone1");
		String orderPhone2=request.getParameter("orderPhone2");
		String userAddr1=request.getParameter("userAddr1");
		String userAddr2=request.getParameter("userAddr2");
		String userAddr3=request.getParameter("userAddr3");
		String msg=request.getParameter("msg");
		String payment=request.getParameter("payment");
		int allPrice=Integer.parseInt(request.getParameter("allPrice"));
		dto.setUserId(userId);
		dto.setOrderRec(orderRec);
		dto.setOrderPhone1(orderPhone1);
		dto.setOrderPhone2(orderPhone2);
		dto.setUserAddr1(userAddr1);
		dto.setUserAddr2(userAddr2);
		dto.setUserAddr3(userAddr3);
		dto.setMsg(msg);
		dto.setPayment(payment);
		dto.setAllPrice(allPrice);
		dao.insert(dto);
		//주문 디테일 추가
		List<CartListDto> list=cartDao.cartList(userId);
		
		for(int i=0;i<list.size();i++) {
			
			int itemNum=list.get(i).getItemNum();
			int quantity=list.get(i).getCartStock();
			int odNum = dto.getOrderNum();
			OrderDetailDto detailDto=new OrderDetailDto();
			detailDto.setItemNum(itemNum);
			detailDto.setOdNum(odNum);
			detailDto.setQuantity(quantity);
			detailDao.detailInsert(detailDto);
			
			categoryDao.minusCount(quantity,itemNum);
		}
		

	}


	    
}
 