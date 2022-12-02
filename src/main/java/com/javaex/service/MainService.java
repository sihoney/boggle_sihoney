package com.javaex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.vo.MusicVo;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.ReviewVo;

@Service
public class MainService {

	@Autowired
	MainDao emoDao;
	
	// 감정 태그 목록
	public List<Map<String, Object>> getEmotion(){
		System.out.println("MainService.getEmotion()");
		
		return emoDao.getEmotion();
	}
	
	//서평+음악 리스트
	public Map<String, Object> getReviewList(Integer userNo, String sort, Integer no) {
		System.out.println("MainService.getReviewList()");

		List<Map<String, Object>> reviewList = new ArrayList<Map<String, Object>>();
		List<MusicVo> musicList = new ArrayList<MusicVo>();
		
		// if(sort == "playlist") 
		// String은 Object, ==는 주소값 비교!, equal은 object, class의 내용 비교
		if(("playlist").equals(sort)) {
			System.out.println("플레이리스트");
			
			reviewList = emoDao.getReviewListByPly(no);
			musicList = emoDao.getMusicListByPly(no);			
		}
		
		else if(no == null) {
			System.out.println("랜덤 감정 태그");
			
			int totalEmotagCnt = emoDao.getTotalEmotagCnt();
			
			reviewList = emoDao.getReviewListByEmo(totalEmotagCnt);
			musicList = emoDao.getMusicListByEmo(totalEmotagCnt);							
		}
		
		else {
			System.out.println("리스트 : 감정 태그 분류");
			
			reviewList = emoDao.getReviewListByEmo(no);
			musicList = emoDao.getMusicListByEmo(no);			
		}

		System.out.println("서평 총 수: " + reviewList.size());
		
		// 로그인 상태라면 하트 카운트 값 받기
		if(userNo != null && reviewList.size() > 0) { 

			for(Map<String, Object> reviewVo : reviewList) { // reviewVo, userNo

				reviewVo.put("userNo", userNo);
			
				int result = emoDao.alreadyLiked(reviewVo);
				
				reviewVo.put("alreadyLikedCnt", result);
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewList", reviewList);
		map.put("musicList", musicList);
		
		return map;
	}
	
	//사이드바>내가 만든 플리 + 좋아요한 플리
	public List<PlaylistVo> getMyPlaylist(int userNo) {
		System.out.println("MainService.getMyPlaylist()");
		
		//List<PlaylistVo> myPlaylist = emoDao.getMyPlaylist(userNo);

		List<PlaylistVo> myPlaylist1 = emoDao.getMyPlaylist(userNo); // playlistNo, playlistName
		List<PlaylistVo> myPlaylist2 = emoDao.getMyPlaylistTwo(userNo);
		
		List<PlaylistVo> myPlaylist = new ArrayList<>();
		myPlaylist.addAll(myPlaylist1);
		myPlaylist.addAll(myPlaylist2);
		
		return myPlaylist;
	}
	
	//모달 > 내가 만든 플리 목록
	public List<Map<String, Object>> getMyPlaylistModal(ReviewVo reviewVo) { // userNo, reviewNo
		System.out.println("MainService.getMyPlaylistModal()");
		
		// 리스트 받기
		List<PlaylistVo> myPlaylist1 = emoDao.getMyPlaylist(reviewVo.getUserNo()); // playlistNo, playlistName
		
		List<Map<String, Object>> modalPlaylist = new ArrayList<Map<String, Object>>();
		
		for(PlaylistVo pvo : myPlaylist1) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("playlistNo", pvo.getPlaylistNo());
			map.put("playlistName", pvo.getPlaylistName());
			map.put("reviewNo", reviewVo.getReviewNo());
			map.put("userNo", pvo.getUserNo());
						
			int alreadyAdded = emoDao.alreadyAdded(map);
			map.put("cnt", alreadyAdded);
			
			modalPlaylist.add(map);	
		}
		
		return modalPlaylist;
	}
	
	//모달 > 새 플리 추가
	public int addNewPlaylist(PlaylistVo pvo) {
		System.out.println("MainService > addNewPlaylist");
		
		return emoDao.addNewPlaylist(pvo);
	}
	
	//모달 > 플리에 서평 추가&취소
	public Integer toggleReviewToPly(Map<String, Object> map) {
		
		Integer result = null;
		
		String btnIcon = String.valueOf( map.get("icon"));
		
		if(btnIcon.equals("fa-plus")) {
			System.out.println("리뷰 추가");
			
			result = emoDao.addReviewToPly(map);
		} else if(btnIcon.equals("fa-check")){
			System.out.println("리뷰 삭제");
			
			result = emoDao.deleteReviewFromPly(map);
		}
		
		return result;
		
	}
	
	//서평 좋아요&취소
	public String toggleReviewLike(ReviewVo reviewVo) {
		
		String result;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewNo", reviewVo.getReviewNo());
		map.put("userNo", reviewVo.getUserNo());
		
		int alreadyLiked = emoDao.alreadyLiked(map);
		
		if(alreadyLiked == 0) { // 좋아요
			emoDao.likeReview(reviewVo);
			result = "좋아요";
		} else { // 좋아요 취소
			emoDao.cancelLike(reviewVo);
			result = "좋아요 취소";
		}
		
		return result;
	}
}
