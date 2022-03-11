package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.EmotionDao;
import com.javaex.vo.ReviewVo;

@Service
public class MainService {

	@Autowired
	EmotionDao emoDao;
	
	public List<Map<String, Object>> getEmotion(){
		System.out.println("MainService > getEmotion()");
		
		return emoDao.getEmotion();
	}
	
	public List<ReviewVo> getReviewListByEmo(Integer emoTag) {
		System.out.println("MainService.getReviewListByEmo()");
		System.out.println(emoTag);
		
		return emoDao.getReviewListByEmo(emoTag);
	}
}
