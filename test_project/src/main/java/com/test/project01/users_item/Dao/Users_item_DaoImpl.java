package com.test.project01.users_item.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.unknown.Dto.Unknown_itemDto;

@Repository
public class Users_item_DaoImpl implements Users_item_Dao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Unknown_itemDto> itemList() {
		List<Unknown_itemDto> dto = session.selectList("users_item.itemSelect");
		return dto;
	}
	
}
