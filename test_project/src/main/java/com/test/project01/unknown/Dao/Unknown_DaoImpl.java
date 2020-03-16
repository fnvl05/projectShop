package com.test.project01.unknown.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Unknown_itemDto> cateList(int cateCode) {
		List<Unknown_itemDto> dto = session.selectList("unknown.cateList", cateCode);
		return dto;
	}
	
}
