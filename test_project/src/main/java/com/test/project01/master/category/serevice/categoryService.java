package com.test.project01.master.category.serevice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;

public interface categoryService {
	public void categoryList(ModelAndView mView);
	public void itemInsert(ItemDto dto);
	public void itemList(ModelAndView mView);
	public void getItemView(ModelAndView mView, int itemNum);
	public void getItemViewList(ModelAndView mView, int itemNum);
	public void getItemUpdateDate(ItemDto dto);
	public void itemDelete(int itemNum, HttpServletRequest request);
}
