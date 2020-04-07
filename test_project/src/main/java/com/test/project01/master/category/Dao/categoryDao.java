package com.test.project01.master.category.Dao;

import java.util.List;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.Item_OrderDetail_Dto;
import com.test.project01.master.category.Dto.User_Orders_Dto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.users.Dto.UsersDto;

public interface categoryDao {
	public List<categoryDto> categoryList();
	public void itemInsert(ItemDto dto);
	public List<ItemDto> itemList();
	public ItemDto itemViewData(int itemNum);
	public ItemViewDto itemViewList(int itemNum);
	public void ItemUpdate(ItemDto dto);
	public void ItemDelete(int itemNum);

	public void minusCount(OrderDetailDto detailDto);
	public List<User_Orders_Dto> userList();
	public List<Item_OrderDetail_Dto> item_orderList();
	public void upResult(OrderDetailDto detailDto);
	public List<UsersDto> userAllList();
	public void userVerify(UsersDto userDto);
	
}
