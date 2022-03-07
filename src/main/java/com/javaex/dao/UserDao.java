package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//로그인시 authUser돌려주는 메소드
	public UserVo checkUser(UserVo userVo) {
		System.out.println("UserDao.checkUser");
		//유저가 입력한 값 잘받아왔나 확인용
		System.out.println(userVo);
		
		UserVo authUser = sqlSession.selectOne("user.selectUser", userVo);
		
		return authUser;
	}

}
