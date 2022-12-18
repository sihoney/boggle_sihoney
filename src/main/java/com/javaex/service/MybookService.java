package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.dao.MybookDao;
import com.javaex.vo.MybookVo;
import com.javaex.vo.PlaylistVo;

@Repository
public class MybookService {
	
	//필드
	@Autowired
	private  MybookDao mybookDao;
	

	public Map<String, Object> list(String sort, int crtPage, int userNo, String emoName, int nowuserNo) {
		
		System.out.println("MybookService.list");
		
		int listCnt = 10;	// 페이지 당 글 개수
		int startNum = (crtPage - 1) * listCnt + 1;	// 시작글 번호
		int endNum = startNum + listCnt - 1;	// 마지막글 번호
		
		System.out.println(">>sort: "+ sort + ", crtPage: " + crtPage + ", startNum: " + startNum + ", endNum: " + endNum);		
		
		List<MybookVo> mybookList;
		int totalCnt;
		switch(sort) {
		case "latest":
			mybookList = mybookDao.getList3(startNum, endNum, userNo, nowuserNo);
			totalCnt = mybookDao.totalCnt(userNo);
			break;
		case "popular":
			mybookList = mybookDao.getPopular2(startNum, endNum, userNo, nowuserNo);
			totalCnt = mybookDao.totalCnt(userNo);
			break;
		default:
			mybookList = mybookDao.emoList(startNum, endNum, userNo, emoName, nowuserNo);
			totalCnt = mybookDao.totalCntEmotion(userNo, emoName);
			break;
		}
		
		/////////////////////
		//// 페이징 
		/////////////////////	
		//int totalCnt = mybookDao.totalCnt(userNo);
		
		int pageBtnCount = 5;	// 페이지당 버튼 갯수
		// 마지막 버튼 번호
		int endPageBtnNo = (int) (Math.ceil(crtPage / (double)pageBtnCount)) * pageBtnCount;
		// 시작 버튼 번호
		int startPageBtnNo = endPageBtnNo - (pageBtnCount - 1);
		
		// 다음 화살표 유무
		boolean next = false;
		if(endPageBtnNo * listCnt < totalCnt) {
			next = true;
		} else { // 다음 화살표가 안보이면 마지막 버튼 값을 다시 계산
			endPageBtnNo = (int) Math.ceil(totalCnt / (double)listCnt);
		}
		
		// 이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
 		
		/////////////////////
		//// 포장 
		/////////////////////
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("mybookList", mybookList);
		pMap.put("prev", prev);
		pMap.put("next", next);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		
		return pMap;			
	}

	//좋아요 여부 확인
	public int likeok(MybookVo checklike) {
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
	public void like(MybookVo checklike) {
		System.out.println("mybookService.like()");
		
		//현재+1
		mybookDao.like(checklike);
	}
	
	//좋아요 취소하는 메소드(review_user에서 삭제)
	public void dislike(MybookVo checklike) {
		System.out.println("mybookService.dislike()");
		
		mybookDao.dislike(checklike);
	}
	
	//유저넘버 입력시 해당유저가 가장 최근에 좋아요한 서평가져오기
	public List<MybookVo> likereview(int userNo) {
		System.out.println("mybookService.likereview");
		
		List<MybookVo> likereview = mybookDao.likereview(userNo);
		
		return likereview;
	}
	
	//해당유저 넘버를 주면 좋아요한 서평리스트를 출력하는 메소드+해당유저의 서평 총 갯수 출력
	public List<MybookVo> likelist(int userNo) {
		System.out.println("mybookService.likelist");
		
		List<MybookVo> likelist = mybookDao.likelist(userNo);
		
		for(int i=0; i<likelist.size(); i++) {
			
			int No = likelist.get(i).getUserNo();
			
			MybookVo reviewcnt = mybookDao.reviewcnt(No);
			int rvcnt = reviewcnt.getLikecheck();
			
			likelist.get(i).setLikecheck(rvcnt);
		}
		
		System.out.println("좋아요한유저서평들"+likelist);
		
		return likelist;
	}
	
	//해당 유저의 넘버와 리뷰넘버를 주면 삭제하는 메소드
	public int delete(MybookVo wannadelete) {
		
		//리뷰넘버정보를 주면 해당 리뷰를 쓴 유저 정보를 줌
		int reviewNo = wannadelete.getReviewNo();
		MybookVo checkuser = mybookDao.checkuser(reviewNo);
		
		int reviewerNo = checkuser.getUserNo();
		int userNo = wannadelete.getUserNo();
		
		System.out.println("리뷰쓴유저넘버 : "+reviewerNo);
		System.out.println("세션유저넘버 : "+userNo);
		
		//그 유저넘버가 지금 세션 유저넘버(받아온값)와 같을때 삭제
		if(reviewerNo == userNo) {
			//삭제, 1은 로그인사용자와 삭제하려는 리뷰작성자가 같음을 의미
			mybookDao.delete(reviewNo);
			
			return 1;
		}else {
			//삭제불가, 0은 로그인사용자와 삭제하려는 리뷰작성자가 다름을 의미
			 return 0;
		}
	}
	
	public List<PlaylistVo> getPlaylist(int reviewNo, int userNo) {
		System.out.println("MybookService.getPlaylist");
		
		return mybookDao.getPlaylist(reviewNo, userNo);
	}
}
