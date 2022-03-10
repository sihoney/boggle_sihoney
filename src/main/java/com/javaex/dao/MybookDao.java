package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MybookVo;

@Repository
public class MybookDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	public List<MybookVo> getList(int userNo){
		System.out.println("MybookDao.getList()");
		
		List<MybookVo> mbList = sqlSession.selectList("mybook.selectList", userNo);
		System.out.println(mbList.toString());
		
		return mbList;
	}
	
	
	
}
