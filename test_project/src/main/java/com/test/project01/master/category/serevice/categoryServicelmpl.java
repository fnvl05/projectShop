package com.test.project01.master.category.serevice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dao.categoryDao;
import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.UsersListDto;
import com.test.project01.master.category.Dto.categoryDto;

import net.sf.json.JSONArray;

@Service
public class categoryServicelmpl implements categoryService {

	@Autowired
	private categoryDao dao;
	
	@Override
	public void categoryList(ModelAndView mView) {
		List<categoryDto> list = dao.categoryList();
		mView.addObject("list",JSONArray.fromObject(list));
	}

	@Override
	public void itemInsert(ItemDto dto) {
		dao.itemInsert(dto);
	}

	@Override
	public void itemList(ModelAndView mView) {
		List<ItemDto> list = dao.itemList();
		mView.addObject("list", list);	
	}
	@Override
	public void getItemView(ModelAndView mView,int itemNum) {
		ItemDto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}

	@Override
	public void getItemViewList(ModelAndView mView, int itemNum) {
		ItemViewDto dto = dao.itemViewList(itemNum);
		mView.addObject("dto", dto);
		List<categoryDto> list = dao.categoryList();
		mView.addObject("list",JSONArray.fromObject(list));			
	}

	@Override
	public void getItemUpdateDate(ItemDto dto) {
		dao.ItemUpdate(dto);	
	}

	@Override
	public void itemDelete(int itemNum, HttpServletRequest request) {
		dao.ItemDelete(itemNum);
	}

	@Override
	public void usersList(ModelAndView mView) {
		List<UsersListDto> userDto = dao.userList();	
		mView.addObject("list", JSONArray.fromObject(userDto));
	}

	@Override
	public void upResult(UsersListDto dto) {
		dao.upResult(dto);
	}
	
	

	


}
