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
	
	public List<Map<String, Object>> getEmotion(){
		System.out.println("MainService > getEmotion()");
		
		return emoDao.getEmotion();
	}
	
	public Map<String, Object> getReviewListByEmo(Integer emoNo, Integer playlistNo) {
		System.out.println("MainService.getReviewListByEmo()");
		
		System.out.println("emoNo: " + emoNo);
		System.out.println("plyNo: " + playlistNo);
		
		List<ReviewVo> reviewList = new ArrayList<ReviewVo>();
		
		if(emoNo != null) {
			System.out.println("list sort by emotion");
			
			reviewList = emoDao.getReviewListByEmo(emoNo);
		}
		else if(playlistNo != null) {
			System.out.println("list sort by playlist");
			
			reviewList = emoDao.getReviewListByPly(playlistNo);
		}
				
		List<MusicVo> musicList = emoDao.getMusicListByEmo(emoNo);
		int musicTotalCnt = emoDao.getMusicTotalCnt(emoNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("musicTotalCnt", musicTotalCnt);
		map.put("reviewList", reviewList);
		map.put("musicList", musicList);
		
		return map;
	}
	
	public List<PlaylistVo> getMyPlaylist(int userNo) {
		System.out.println("MainService.getMyPlaylist()");
		
		List<PlaylistVo> myPlaylist = emoDao.getMyPlaylist(userNo);

		return myPlaylist;
	}
	
	public List<Map<String, Object>> getMyPlaylistModal(ReviewVo reviewVo) { // userNo, reviewNo
		System.out.println("MainService.getMyPlaylistModal()");
		
		List<PlaylistVo> myPlaylist = emoDao.getMyPlaylist(reviewVo.getUserNo()); // playlistNo, playlistName
		
		List<Map<String, Object>> modalPlaylist = new ArrayList<Map<String, Object>>();
		
		for(PlaylistVo pvo : myPlaylist) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("playlistNo", pvo.getPlaylistNo());
			map.put("playlistName", pvo.getPlaylistName());
			
			map.put("reviewNo", reviewVo.getReviewNo());
			map.put("userNo", reviewVo.getUserNo());
						
			int alreadyAdded = emoDao.alreadyAdded(map);

			map.put("cnt", alreadyAdded);

			modalPlaylist.add(map);
			
		}
		
		return modalPlaylist;
	}
	
	public int addNewPlaylist(PlaylistVo pvo) {
		emoDao.addNewPlaylist(pvo);
		
		System.out.println(pvo);
		
		return emoDao.addNewPlaylistAtUser(pvo);
	}
	
	public void toggleReviewToPly(Map<String, Object> map) {
		
		String btnIcon = String.valueOf( map.get("icon"));
		System.out.println(btnIcon);
		
		if(btnIcon.equals("fa-plus")) {
			System.out.println("추가");
			
			emoDao.addReviewToPly(map);
		} else if(btnIcon.equals("fa-check")){
			System.out.println("삭제");
			
			emoDao.deleteReviewFromPly(map);
		}
		
	}
}
