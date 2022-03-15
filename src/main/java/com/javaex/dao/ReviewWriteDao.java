package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewWriteDao {

	@Autowired
	SqlSession sqlSession;
	
	public int getReviewTotalCnt(long isbn) {
		return sqlSession.selectOne("reviewwrite.getReviewTotalCnt", isbn);
	}
}
