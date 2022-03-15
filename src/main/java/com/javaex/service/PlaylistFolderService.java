package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PlaylistFolderDao;
import com.javaex.vo.BookreviewVo;
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
	
	/* 서평 추가 모달 서평전체리스트 */
	public List<BookreviewVo> ReviewListSelect() {
		
		System.out.println("Service.ReviewListSelect");
		List<BookreviewVo> reviewListAll = playlistfolderDao.ReviewListSelect();
		
		return reviewListAll;
	}

}
