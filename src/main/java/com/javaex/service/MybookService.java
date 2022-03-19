package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.dao.MybookDao;
import com.javaex.vo.MybookVo;

@Repository
public class MybookService {
	
	//필드
	@Autowired
	private  MybookDao mybookDao;
	
	//유저번호 입력시 해당유저 서평리스트 출력해주는 메소드
	public List<MybookVo> list(int userNo){
		System.out.println("mybookService.list()");
		
		List<MybookVo> mbList = mybookDao.getList(userNo);
		
		return mbList;
	}
	
	//유저번호 입력시 해당유저 서평리스트 출력해주는 메소드(최신순)
	public List<MybookVo> popularlist(int userNo){
		System.out.println("mybookService.popularlist()");
		
		List<MybookVo> mbList = mybookDao.getPopular(userNo);
		
		return mbList;
	}
	
	
	//좋아요 여부 확인
	public int likeok(MybookVo checklike) {
		//System.out.println("mybookService.likeok()");

		int count = mybookDao.checklike(checklike);

		return count;
	}
	
	
	//좋아요 확인, 좋아요 몇개인지 확인하는 메소드
	public MybookVo likecnt(MybookVo checklike) {
		//System.out.println("mybookService.likeok()");
		
		//좋아요 여부 확인
		int count = mybookDao.checklike(checklike);
		
		//좋아요 몇개인지 확인
		MybookVo likeok = mybookDao.checklikecnt(checklike);
		
		//두개를 Vo에 넣기
		likeok.setLikecheck(count);		
		
		System.out.println(likeok);
		
		return likeok;
	}
	
	//좋아요를 하는 메소드(review_user에 인서트)
	public int like(MybookVo checklike) {
		System.out.println("mybookService.like()");
		
		//현재+1
		mybookDao.like(checklike);
		
		//실제 값가져오기
		return 5;
	}
	
	//좋아요 취소하는 메소드(review_user에서 삭제)
	public void dislike(MybookVo checklike) {
		System.out.println("mybookService.dislike()");
		
		mybookDao.dislike(checklike);
	}
	
	
}
