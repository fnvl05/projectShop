package com.test.project01.users.Dao;

import java.util.List;

import com.test.project01.users.Dto.UsersDto;

public interface UsersDao {
	// 회원가입, 로그인
	public void insert(UsersDto dto);
	public boolean isExist(String userId);
	public String getPassHash(String userId);
	public UsersDto logIn(String userId);
	// 비밀번호 수정, 개인정보, 탈퇴
	public UsersDto getData(String id);
	public void delete(String id);
	
	
	public void updatePass(UsersDto dto);
	public void update(UsersDto dto );
	
	
}
