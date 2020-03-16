package com.test.project01.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dao.Unknown_Dao;
import com.test.project01.unknown.Dto.Unknown_itemDto;

@Service
public class Unknown_serviceImpl implements Unknown_service{
	
	@Autowired
	Unknown_Dao dao;
	
	@Override
	public void itemList(ModelAndView mView) {
		List<Unknown_itemDto> list = dao.itemList();
		mView.addObject("list", list);
	}

	@Override
	public void getItemView(ModelAndView mView,int itemNum) {
		Unknown_itemDto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}
	

}
