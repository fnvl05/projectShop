package com.test.project01.master.category.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.UsersListDto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.users.Dto.UsersDto;

@Repository
public class categoryDaolmpl implements categoryDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<categoryDto> categoryList() {	
		List<categoryDto> list = session.selectList("category.list");
		return list;
	}

	@Override
	public void itemInsert(ItemDto dto) {
		session.insert("category.itemInsert", dto);
	}

	@Override
	public List<ItemDto> itemList() {
		List<ItemDto> list = session.selectList("category.itemSelect");
		return list;
	}

	@Override
	public ItemDto itemViewData(int itemNum) {
		return session.selectOne("category.itemViewContent", itemNum);
	}

	@Override
	public ItemViewDto itemViewList(int itemNum) {
		return session.selectOne("category.itemViewData", itemNum);
	}

	@Override
	public void ItemUpdate(ItemDto dto) {
		session.update("category.itemUpDate", dto);
	}

	@Override
	public void ItemDelete(int itemNum) {
		session.delete("category.itemDelete", itemNum);
	}
	@Override
	public List<UsersListDto> userList() {
		List<UsersListDto> userList = session.selectList("category.selectList");
		return userList;
	}

	@Override
	public void upResult(UsersListDto dto) {
		session.update("category.resultUpDate");
	}

	@Override
	public void minusCount(int quantity,int itemNum) {
		session.update("category.minusCount",quantity);
	}
	
	
}
