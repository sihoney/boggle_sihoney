package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.StyleVo;

@Repository
public class ReviewWriteDao {

	@Autowired
	SqlSession sqlSession;
	
	public int getReviewTotalCnt(long isbn) {
		return sqlSession.selectOne("reviewwrite.getReviewTotalCnt", isbn);
	}
	
	public List<StyleVo> getStyle(int emoNo) {
		List<StyleVo> list = sqlSession.selectList("reviewwrite.getStyle", emoNo);
		
		System.out.println("style list: " + list);
		
		return list;
	}
	
	public int addReview(Map<String, Object> map) {
		int result = sqlSession.insert("reviewwrite.addReview", map);
		
		System.out.println(result + "건 | 리뷰가 저장됨");
		
		return result;
	}
	
	public void addGenre(Map<String, Object> map) {
		int result = sqlSession.insert("reviewwrite.addGenre", map);
		
		System.out.println(result + "건 | 장르 저장");
	}
	
	public void addBook(Map<String, Object> map) {
		int result = sqlSession.insert("reviewwrite.addBook", map);
		
		System.out.println(result + "건 | book 저장");
	}
	
	public int checkGenre(Map<String,Object> map) {
		return sqlSession.selectOne("reviewwrite.checkGenre", map);
	}
	
	public int checkBook(Map<String, Object> map) {
		return sqlSession.selectOne("reviewwrite.checkBook", map);
	}
}
