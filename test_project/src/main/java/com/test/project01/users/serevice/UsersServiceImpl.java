package com.test.project01.users.serevice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dao.UsersDao;
import com.test.project01.users.Dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	
	@Override
	public void addUser(UsersDto dto) {
		String encodedPwd = new BCryptPasswordEncoder().encode(dto.getUserPass());
		dto.setUserPass(encodedPwd);
		dao.insert(dto);		
	}
	
	@Override
	public Map<String, Object> isExistId(String inputUsersId) {
		boolean isExistId = dao.isExist(inputUsersId);
		Map<String, Object> map = new HashMap<>();
		map.put("isExist", isExistId);
		return map;
	}

	@Override
	public boolean validUsers(UsersDto dto, HttpSession session, ModelAndView mView) {
		boolean isValid = false;
		String passHash = dao.getPassHash(dto.getUserId());
		if(passHash != null) {
			isValid=BCrypt.checkpw(dto.getUserPass(), passHash);
		}
		if(isValid) {
			UsersDto userdto = dao.logIn(dto.getUserId());
			session.setAttribute("userDto", userdto);
			String id=userdto.getUserId();
			String master=String.valueOf(userdto.getVerify());
			session.setAttribute("id", id);
			session.setAttribute("master", master);
			return true;
		}
		else {
			return false;
		}
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
