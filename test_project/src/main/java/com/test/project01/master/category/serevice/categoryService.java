package com.test.project01.master.category.serevice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.User_Orders_Dto;
import com.test.project01.order.dto.OrderDetailDto;

public interface categoryService {
	public void categoryList(ModelAndView mView);
	public void itemInsert(ItemDto dto);
	public void itemList(ModelAndView mView);
	public void getItemView(ModelAndView mView, int itemNum);
	public void getItemViewList(ModelAndView mView, int itemNum);
	public void getItemUpdateDate(ItemDto dto);
	public void itemDelete(int itemNum, HttpServletRequest request);
	public void TotalList(ModelAndView mView);
	public void upResult(OrderDetailDto detailDto);
}
