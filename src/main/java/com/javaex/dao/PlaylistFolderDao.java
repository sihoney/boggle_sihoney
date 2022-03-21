package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PlaylistFolderVo;
import com.javaex.vo.ReviewVo;

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
	
	/* 플리 모달 페이징 */
	public List<PlaylistFolderVo> madalListPage(int startRnum, int endRnum) {
		
		System.out.println("Dao.modalPage");
		System.out.println(startRnum+","+endRnum);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<PlaylistFolderVo> playlistPage = sqlSession.selectList("playlistFolder.modalPage",map);
		System.out.println(playlistPage);
		
		return playlistPage;
	}
	
	/* 전체 글갯수 가져오기 */
	public int selectTotal() {
		System.out.println("Dao.selectTotal");
		int totalCnt = sqlSession.selectOne("playlistFolder.totalCnt");
		return totalCnt;
		
	}
	
	
	/* 플리 검색 결과 가져오기 */
	public List<PlaylistFolderVo> getSearchResult(String search) {
		
		System.out.println("Dao.getSearchResult");
		List<PlaylistFolderVo> searchResult = sqlSession.selectList("playlistFolder.playlistSearch",search);
		
		System.out.println("검색 결과 : "+searchResult);
		
		return searchResult;
	}
}
