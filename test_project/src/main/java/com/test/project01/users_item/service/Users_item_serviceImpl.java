package com.test.project01.users_item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.users_item.Dao.Users_item_Dao;

@Service
public class Users_item_serviceImpl implements Users_item_service{
	
	@Autowired
	Users_item_Dao dao;
	
	@Override
	public void itemList(ModelAndView mView) {
		List<Unknown_itemDto> list = dao.itemList();
		mView.addObject("list", list);
	}
}
