package com.test.project01.users_item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.users_item.Dao.Users_item_Dao;
import com.test.project01.users_item.Dto.Users_item_Dto;

@Service
public class Users_item_serviceImpl implements Users_item_service{
	
	@Autowired
	Users_item_Dao dao;
	
	@Override
	public void itemList(ModelAndView mView) {
		List<Users_item_Dto> list = dao.itemList();
		mView.addObject("list", list);
	}

	@Override
	public void getItemView(ModelAndView mView, int itemNum) {
		Users_item_Dto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}

	@Override
	public List<Users_item_Dto> cateList(int cateCode, int cateLevel) {
		int cateCodeRef = 0;
		if(cateLevel == 1) {
			cateCodeRef = cateCode;
			return dao.cateList1(cateCode, cateCodeRef);
		}else {			
			return dao.cateList2(cateCode);
		}
	}
}
