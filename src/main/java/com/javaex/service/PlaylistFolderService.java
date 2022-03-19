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
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트  */
	public Map<String, Object> playlistReviewList(int playlistNo, int userNo) {
		
		System.out.println("Service.playlistReviewList");
		
		// 서평 리스트 
		List<PlaylistFolderVo> playList = playlistfolderDao.playlistReviewList(playlistNo);
		
		//선택한 플리 커버 내용
		String playlistCover = playlistfolderDao.playlistCover(playlistNo,userNo);
		
		//데이터 모으기
		Map<String, Object> playlistVo = new HashMap<String, Object>();
		playlistVo.put("playList", playList);
		playlistVo.put("playlistCover", playlistCover);		

		return playlistVo;
		
	}

	/* 플리 모달 페이징 */
	public Map<String,Object> madalListPage(int crtPage) {
		
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
		List<PlaylistFolderVo> modalList = playlistfolderDao.madalListPage(startRnum,endRnum);
		
		//2) ★페이지 카운트 가져오기-----------------
		//전체 글갯수 가져오기
		int totalCnt = playlistfolderDao.selectTotal();
		System.out.println("totalCnt:"+totalCnt);
		
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
		playlistMap.put("startPageBtnNo", startPageBtnNo);
		playlistMap.put("endPageBtnNo", endPageBtnNo);
		playlistMap.put("next", next);
		playlistMap.put("modalList", modalList);
		
		return playlistMap;

	}
	
	/* 플리 검색 결과 가져오기 */
	public List<PlaylistFolderVo> getSearchResult(String search) {
		
		System.out.println("Service.getSearchResult");
		
		List<PlaylistFolderVo> searchResult = playlistfolderDao.getSearchResult(search);
		
		return searchResult;
	}

}
