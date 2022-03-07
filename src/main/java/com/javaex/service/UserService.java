package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Repository
public class UserService {
	
	//필드
	@Autowired
	private UserDao userDao;
	
	
	//로그인, 입력값 > 넘버, 이름 돌려주는 메소드
	public UserVo login(UserVo userVo) {
		System.out.println("UserService.login()");
		
		UserVo authUser = userDao.checkUser(userVo);
		
		return authUser;
	}

}
