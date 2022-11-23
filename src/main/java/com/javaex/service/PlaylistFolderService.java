package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PlaylistFolderDao;
import com.javaex.vo.PlaylistFolderVo;

@Service
public class PlaylistFolderService {
	
	@Autowired
	private PlaylistFolderDao playlistfolderDao;
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트 + 페이징 */
	public Map<String, Object> playlistReviewList(int playlistNo, int makerUserNo, int crtPage, int authUserNo) {
		
		System.out.println("Service.playlistReviewList+paging");
		
		//★플레이리스트 커버-----------------
		PlaylistFolderVo playlistCover = playlistfolderDao.playlistCover(playlistNo, makerUserNo);
		
		// 서평 리스트+페이징
		// ★리스트 가져오기
		int listCnt = 5;
		//현재페이지 처리 0이하 접근 제한
		crtPage = (crtPage>0) ? crtPage : (crtPage=1);
		//페이지 시작글 번호
		int startRnum = (crtPage-1)*listCnt +1;
		//페이지 마지막글 번호
		int endRnum = (startRnum + listCnt) -1;
		//rownum 리스트 요청
		List<PlaylistFolderVo> playList = playlistfolderDao.playlistReviewList(playlistNo,startRnum,endRnum);
		
		// alreadyLiked 여부 체크하기
		for(PlaylistFolderVo pfvo : playList) { 
			
			pfvo.setUserNo(authUserNo); //오류: 작성자가 해당 리뷰를 좋아요했는지 검사 --> 해당 유저가 좋아요했는지 검사해야함
			
			boolean alreadyLiked = playlistfolderDao.checkAlreadyLiked(pfvo);
			
			System.out.println("alreadyLiked: " + alreadyLiked);
			
			pfvo.setAlreadyLiked(alreadyLiked);
		}
		
		//2) ★페이지 카운트 가져오기-----------------
		//전체 글갯수 가져오기
		int folderReviewCnt = playlistfolderDao.folderReviewTotal(playlistNo);
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//마지막 버튼 번호(올림해서 한 그룹에 동일한 값이 나오도록 만들어준다)
		int endPageBtnNo = (int)(Math.ceil( crtPage/(double)pageBtnCount))*pageBtnCount;
		
		//시작 버튼 번호
		int startPageBtnNo = endPageBtnNo - (pageBtnCount-1); 
		
		//다음 화살표 유무
		boolean next = false;
		if(endPageBtnNo*listCnt < folderReviewCnt) {
			next = true;
		}else {//다음 화살표가 안보이면 마지막 버튼값을 다시 계산
			endPageBtnNo = (int)Math.ceil(folderReviewCnt/(double)listCnt);
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		//3) ★포장---------------------------------
		Map<String,Object> playlistPage = new HashMap<String,Object>();
		playlistPage.put("prev", prev);
		playlistPage.put("startPageBtnNo", startPageBtnNo);
		playlistPage.put("endPageBtnNo", endPageBtnNo);
		playlistPage.put("next", next);
		playlistPage.put("playList", playList);
		playlistPage.put("playlistCover", playlistCover);

		return playlistPage;
		
	}

	/* 플리 모달 페이징 */
	public Map<String,Object> modalListPage(int crtPage, int playlistNo) {
		
		System.out.println("Service.modalListPage");
		
		
		//★리스트 가져오기
		//페이지당 글 개수
		int listCnt = 5;
		
		//현재페이지 처리(0이하 접근 제한)
		crtPage = (crtPage>0) ? crtPage : (crtPage=1);
		
		//페이지 시작글 번호
		int startRnum = (crtPage-1)*listCnt +1;
		//페이지 마지막 글 번호
		int endRnum = (startRnum + listCnt) -1;
		//vo로 묶어서 보내주기
		List<PlaylistFolderVo> modalList = playlistfolderDao.modalListPage(startRnum,endRnum, playlistNo);
		
		//2) ★페이지 카운트 가져오기-----------------
		//전체 글갯수 가져오기
		int totalCnt = playlistfolderDao.selectTotal(playlistNo);
		System.out.println("서평 총 수 :"+totalCnt);
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//마지막 버튼 번호
		int endPageBtnNo = (int)(Math.ceil( crtPage/(double)pageBtnCount))*pageBtnCount;
		
		//시작 버튼 번호
		int startPageBtnNo = endPageBtnNo - (pageBtnCount-1);
		
		//다음 화살표 유무
		boolean next = false;
		if(endPageBtnNo*listCnt < totalCnt) {
			next = true;
		}else {//다음 화살표가 안보이면 마지막 버튼값을 다시 계산
			endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		//3) ★포장---------------------------------
		Map<String,Object> playlistMap = new HashMap<String,Object>();
		playlistMap.put("prev", prev);
		playlistMap.put("next", next);
		playlistMap.put("startPageBtnNo", startPageBtnNo);
		playlistMap.put("endPageBtnNo", endPageBtnNo);
		playlistMap.put("modalList", modalList);
		
		return playlistMap;

	}
	
	/* 플리 검색 결과 가져오기 (+ 페이징)*/
	public Map<String, Object> getSearchResult(String search, int crtPage, int playlistNo) {
		
		System.out.println("Service.getSearchResult");
		
		//★리스트 가져오기
		//페이지당 글 개수
		int listCnt = 5;
		
		//현재페이지 처리(0이하 접근 제한)
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
		
		//페이지 시작글 번호
		int startNum = (crtPage - 1) * listCnt + 1;
		//페이지 마지막 글 번호
		int endNum = (startNum + listCnt) - 1;
		//vo로 묶어서 보내주기
		//List<PlaylistFolderVo> modalList = playlistfolderDao.modalListPage(startRnum,endRnum, playlistNo);
		List<PlaylistFolderVo> searchResult = playlistfolderDao.getSearchResult(startNum, endNum, playlistNo, search);
		
		//2) ★페이지 카운트 가져오기-----------------
		//전체 글갯수 가져오기
		int totalCnt = playlistfolderDao.selectTotalSearchReview(playlistNo, search);
		System.out.println("검색 결과 총 수 :"+totalCnt);
		System.out.println("[[searchResult]]: " + searchResult);
		
		//페이지당 버튼 갯수
		int pageBtnCount = 5;
		
		//마지막 버튼 번호
		int endPageBtnNo = (int)(Math.ceil( crtPage/(double)pageBtnCount))*pageBtnCount;
		
		//시작 버튼 번호
		int startPageBtnNo = endPageBtnNo - (pageBtnCount-1);
		
		//다음 화살표 유무
		boolean next = false;
		if(endPageBtnNo * listCnt < totalCnt) {
			next = true;
		}
		else {//다음 화살표가 안보이면 마지막 버튼값을 다시 계산
			endPageBtnNo = (int)Math.ceil(totalCnt/(double)listCnt);
		}
		
		//이전 화살표 유무
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		//3) ★포장---------------------------------
		Map<String,Object> playlistMap = new HashMap<String,Object>();
		playlistMap.put("prev", prev);
		playlistMap.put("next", next);
		playlistMap.put("startPageBtnNo", startPageBtnNo);
		playlistMap.put("endPageBtnNo", endPageBtnNo);
		playlistMap.put("searchResult", searchResult);
		
		return playlistMap;
	}
	
	/* 선택 서평 등록하기 */
	public int reviewsInsert( PlaylistFolderVo playlistFolderVo,  List<Integer> reviewChkBoxArr) {
		
		System.out.println("Service.reviewsInsert");
		
		int addList = 0;
		
		for(int i = 0; i < reviewChkBoxArr.size(); i++) {
			
			playlistFolderVo.setReviewNo(reviewChkBoxArr.get(i));
			
			addList = playlistfolderDao.reviewsInsert(playlistFolderVo);
		}
		
		return addList;
	}
	
	/* 서평 삭제 */
	public int reviewDelete(int reviewNo) {
		System.out.println("Service.reviewDelete");
		int deleteResult = playlistfolderDao.reviewDelete(reviewNo);		
		return deleteResult;
	}
	
	/* 로딩시 좋아요 체크 */
	public int checkPlyAlreadyLiked(PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Service.checkPlyAlreadyLiked");
		int checkLike = playlistfolderDao.checkPlyAlreadyLiked(playlistFolderVo);
		
		return checkLike;
	}
	
	/* 해당 플리 좋아요 취소 */
	public int playlistUnlike(PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Service.playlistUnlike");
		int unlikeResult = playlistfolderDao.playlistUnlike(playlistFolderVo);
		
		return unlikeResult;
		
	}
	
	public int playlistlike(PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Service.playlistlike");
		int likeResult = playlistfolderDao.playlistlike(playlistFolderVo);
		
		return likeResult;
	}

	public int toggleLikeReview(Integer userNo, Integer reviewNo) {
		
		System.out.println("Service.toggleLikeReview");
		return playlistfolderDao.toggleLikeReview(userNo, reviewNo);
	}
	
	public int deleteReview(int reviewNo, int playlistNo) {
		
		System.out.println("Service.deleteReview");
		return playlistfolderDao.deleteReview(reviewNo, playlistNo);
	}
}
