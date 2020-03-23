package com.test.project01.users.Dao;

import java.util.List;

import com.test.project01.users.Dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public boolean isExist(String inputUsersId);
	public String getPassHash(String inputUsersId);
	public UsersDto logIn(String usersId);
}
