package com.test.project01.master.category.Dao;

import java.util.List;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.User_Orders_Dto;
import com.test.project01.master.category.Dto.categoryDto;

public interface categoryDao {
	public List<categoryDto> categoryList();
	public void itemInsert(ItemDto dto);
	public List<ItemDto> itemList();
	public ItemDto itemViewData(int itemNum);
	public ItemViewDto itemViewList(int itemNum);
	public void ItemUpdate(ItemDto dto);
	public void ItemDelete(int itemNum);
	public List<User_Orders_Dto> userList();
	public void upResult(User_Orders_Dto dto);
	public void minusCount(int quantity,int itemNum);
}
