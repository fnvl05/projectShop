package com.test.project01.unknown.Dao;

import java.util.List;

import com.test.project01.unknown.Dto.Unknown_itemDto;

public interface Unknown_Dao {
	public List<Unknown_itemDto> itemList();
	public Unknown_itemDto itemViewData(int itemNum);
}
