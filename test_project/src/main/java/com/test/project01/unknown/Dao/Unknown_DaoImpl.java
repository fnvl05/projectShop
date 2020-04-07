package com.test.project01.unknown.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dto.Unknown_itemDto;

@Repository
public class Unknown_DaoImpl implements Unknown_Dao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Unknown_itemDto> itemList() {
		List<Unknown_itemDto> dto = session.selectList("unknown.itemSelect");
		return dto;
	}

	@Override
	public Unknown_itemDto itemViewData(int itemNum) {
		return session.selectOne("unknown.itemViewContent", itemNum);
	}

	@Override
	public List<Unknown_itemDto> cateList1(int cateCode, int cateCodeRef) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);		
		return session.selectList("unknown.cateList1", map);
	}
	
	@Override
	public List<Unknown_itemDto> cateList2(int cateCode) {
		List<Unknown_itemDto> dto = session.selectList("unknown.cateList2", cateCode);
		return dto;
	}
	
	@Override
	public List<ItemDto> itemBestList() {
		List<ItemDto> dto = session.selectList("category.bestItemList");
		return dto;
	}

	@Override
	public List<ItemDto> itemNewList() {
		List<ItemDto> dto = session.selectList("category.newItemLsit");
		return dto;
	}

	
}
