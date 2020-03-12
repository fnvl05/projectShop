package com.test.project01.users.serevice;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dto.UsersDto;

public interface UsersService {
	public void addUser(UsersDto dto);
	public Map<String, Object> isExistId(String inputUsersId);
	public boolean validUsers(UsersDto dto, HttpSession session, ModelAndView mView);
	
}
