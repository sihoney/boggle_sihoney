package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ReviewVo;

@Repository
public class EmotionDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> getEmotion(){
		System.out.println("EmotionDao.getEmotion()");
		
		List<Map<String, Object>> list =  sqlSession.selectList("emotion.getEmotion");
		
		return list;
	}
	
	public List<ReviewVo> getReviewListByEmo(int emoNum) {
		System.out.println("EmotionDao.getReviewListByEmo()");
		
		List<ReviewVo> list =  sqlSession.selectList("emotion.getReviewListByEmo", 1);
		
		return list;
	}
}
