package com.test.project01.users_item.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.users_item.Dto.Users_item_Dto;

@Repository
public class Users_item_DaoImpl implements Users_item_Dao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Users_item_Dto> itemList() {
		List<Users_item_Dto> dto = session.selectList("Users_item.itemSelect");
		return dto;
	}
	
	@Override
	public Users_item_Dto itemViewData(int itemNum) {
		return session.selectOne("Users_item.itemViewContent", itemNum);
	}

	@Override
	public List<Users_item_Dto> cateList1(int cateCode, int cateCodeRef) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);		
		return session.selectList("Users_item.cateList1", map);
	}

	@Override
	public List<Users_item_Dto> cateList2(int cateCode) {
		List<Users_item_Dto> dto = session.selectList("Users_item.cateList2", cateCode);
		return dto;
	}

	
	
}
