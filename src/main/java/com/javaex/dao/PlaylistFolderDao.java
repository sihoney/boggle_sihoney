package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BookreviewVo;
import com.javaex.vo.PlaylistFolderVo;

@Repository
public class PlaylistFolderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트  */
	public List<PlaylistFolderVo> playlistReviewList(int playlistNo) {
		
		System.out.println("Dao.playlistReviewList");
		
		//서평리스트
		List<PlaylistFolderVo> playList = sqlSession.selectList("playlistFolder.reviewList",playlistNo);
		System.out.println(playList);

		return playList;
		
	}
	
	
	/* 플레이리스트 커버 */
	public String playlistCover(int playlistNo, int userNo) {
		
		System.out.println("Dao.playlistCover");
		
		Map<String, Integer> playlist = new HashMap<String, Integer>();
		playlist.put("playlistNo", playlistNo);
		playlist.put("userNo", userNo);
		
		//커버 
		String playlistCover = sqlSession.selectOne("playlistFolder.playlistCover",playlist);
		System.out.println(playlistCover);
				
		
		return playlistCover;
		
	}
	
	/* 서평 추가 모달 서평전체리스트 */
	public List<BookreviewVo> ReviewListSelect() {
		
		System.out.println("Dao.ReviewListSelect");
		
		List<BookreviewVo> reviewListAll = sqlSession.selectList("playlistFolder.reviewAll");
		
		return reviewListAll;
		
	}

}
