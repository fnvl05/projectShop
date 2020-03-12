package com.test.project01.users.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.users.Dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public boolean isExist(String inputUsersId) {
		String id=session.selectOne("users.isExist", inputUsersId);
		if(id == null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String getPassHash(String inputUsersId) {
		String savedPwd = session.selectOne("users.getPassHash", inputUsersId);
		return savedPwd;
	}

	@Override
	public UsersDto logIn(String inputUserId) {
		return session.selectOne("users.login", inputUserId);
	}


}
