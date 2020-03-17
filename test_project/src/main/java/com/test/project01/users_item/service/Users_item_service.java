package com.test.project01.users_item.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users_item.Dto.Users_item_Dto;

public interface Users_item_service {
	public void itemList(ModelAndView mView);
	public void getItemView(ModelAndView mView, int itemNum);
	public List<Users_item_Dto> cateList(int cateCode, int cateLevel);
}
