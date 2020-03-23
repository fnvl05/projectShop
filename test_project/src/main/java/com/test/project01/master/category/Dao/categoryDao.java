package com.test.project01.master.category.Dao;

import java.util.List;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.UsersListDto;
import com.test.project01.master.category.Dto.categoryDto;

public interface categoryDao {
	public List<categoryDto> categoryList();
	public void itemInsert(ItemDto dto);
	public List<ItemDto> itemList();
	public ItemDto itemViewData(int itemNum);
	public ItemViewDto itemViewList(int itemNum);
	public void ItemUpdate(ItemDto dto);
	public void ItemDelete(int itemNum);
	public List<UsersListDto> userList();
	public void upResult(UsersListDto dto);
	public void minusCount(int quantity,int itemNum);

}
