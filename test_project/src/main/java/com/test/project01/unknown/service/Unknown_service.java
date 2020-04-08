package com.test.project01.unknown.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.Dto.Unknown_itemDto;

public interface Unknown_service {
	public void itemList(ModelAndView mView);
	public void getItemView(ModelAndView mView, int itemNum);
	public List<Unknown_itemDto> cateList(int cateCode, int cateLevel);

//	public void bestItemList(ModelAndView mView);
//	public void newItemList(ModelAndView mView);

}
