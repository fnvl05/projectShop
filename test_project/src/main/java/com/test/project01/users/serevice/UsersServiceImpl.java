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
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao dao;

	// 로긴
	@Override
	public Map<String, Object> isExistId(String inputUserId) {
		boolean isExistId = dao.isExist(inputUserId);
		Map<String, Object> map = new HashMap<>();
		map.put("isExist", isExistId);
		return map;
	}
	
	@Override
	public void addUser(UsersDto dto) {
		// 비밀번호 암호화
		String encodePass = new BCryptPasswordEncoder().encode(dto.getUserPass());
		dto.setUserPass(encodePass);
		dao.insert(dto);
	}
	
	@Override
	public boolean validUsers(UsersDto dto, HttpSession session, ModelAndView mView) {
		boolean isValid = false;
		String passHash = dao.getPassHash(dto.getUserId());
		if (passHash != null) {
			isValid = BCrypt.checkpw(dto.getUserPass(), passHash);
		}
		if (isValid) {
			UsersDto userDto = dao.logIn(dto.getUserId());
			session.setAttribute("userDto", userDto);
			session.setAttribute("id", userDto.getUserId());
			session.setAttribute("verify", userDto.getVerify());
			return true;
		} else {
			return false;
		}
	}
	
	// 개인정보
	@Override
	public void showInfo(String id, ModelAndView mView) {
		UsersDto dto=dao.getData(id);	
		mView.addObject("dto", dto);
	}
	
	// 비밀번호 바꾸기
	@Override
	public void updatePass(UsersDto dto, ModelAndView mView) {
		String PassHash=dao.getData(dto.getUserId()).getUserPass();
		boolean isValid=BCrypt.checkpw(dto.getUserPass(), PassHash);
		
		if(isValid) {
			String encodePass= new BCryptPasswordEncoder().encode(dto.getNewPass());
			dto.setNewPass(encodePass);
			dao.updatePass(dto);
			mView.addObject("isSuccess", true);
			
		} else {
			
			mView.addObject("isSuccess", false);
		
		}

	}
	
	// 개인정보 바꾸기
	public void userUpdate(UsersDto dto) {
		dao.update(dto);
	}
	
	// 회원탈퇴
	@Override
	public void deleteUser(String id) {
		dao.delete(id);
	}
}