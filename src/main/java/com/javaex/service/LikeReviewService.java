package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.LikeReviewDao;
import com.javaex.vo.LikeReviewVo;

@Service
public class LikeReviewService {

	@Autowired
	private LikeReviewDao likeReviewDao;
	
	/*해당 유저가 좋아요한 서평 리스트*/
	public List<LikeReviewVo> getLRist(int userNo){
		System.out.println("Service.getLikeReviewList");

		List<LikeReviewVo> lrList= likeReviewDao.getLRist(userNo);
		return lrList;
		
//		return likeReviewDao.getLikeReviewList(userNo);
	}
	
	/*서평정보*/
//	
//	public ReviewVo getlrVo(String userNo) {
//		System.out.println("Service.getlrVo");
//		return likeReviewDao.getLikeReviewVo(userNo);
//	}
}
