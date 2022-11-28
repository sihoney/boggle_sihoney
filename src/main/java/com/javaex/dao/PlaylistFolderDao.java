package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.LikeReviewVo;
import com.javaex.vo.PlaylistFolderVo;

@Repository
public class PlaylistFolderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트  */
	public List<PlaylistFolderVo> playlistReviewList(int playlistNo,int startRnum, int endRnum) {
		
		System.out.println("PlaylistFolderDao.playlistReviewList");
		
		//map 
		Map<String, Object> playlistData = new HashMap<String, Object>();
		playlistData.put("playlistNo", playlistNo);
		playlistData.put("startRnum", startRnum);
		playlistData.put("endRnum", endRnum);
		
		//서평리스트
		List<PlaylistFolderVo> playList = sqlSession.selectList("playlistFolder.reviewList2", playlistData);
		
		return playList;
		
	}
	
	/* 해당 플리(folder) 총 서평 수  */
	public int folderReviewTotal(int playlistNo) {
		System.out.println("PlaylistFolderDao.folderReviewTotal");
		
		int folderReviewCnt = sqlSession.selectOne("playlistFolder.folderReviewCnt",playlistNo);
		
		System.out.println(playlistNo + "번 플리 총 서평 수 : " + folderReviewCnt);
		
		return folderReviewCnt;
	}

	/* 플레이리스트 커버 */
	public PlaylistFolderVo playlistCover(int playlistNo, int userNo) {
	  
	  System.out.println("PlaylistFolderDao.playlistCover");
	  
	  Map<String, Integer> playlist = new HashMap<String, Integer>();
	  playlist.put("playlistNo", playlistNo); 
	  playlist.put("userNo", userNo);
	  
	  //playlistCover 
	  PlaylistFolderVo playlistCover = sqlSession.selectOne("playlistFolder.playlistCover",playlist);
	  //System.out.println(playlistCover);

	  return playlistCover;
	  
	  }
	
	public boolean checkAlreadyLiked(PlaylistFolderVo pfvo) {
		int cnt = sqlSession.selectOne("playlistFolder.checkAlreadyLiked", pfvo);
		
		if(cnt > 0) {
			return true;
		}
		
		return false;
	}

	/* 플리 모달 페이징 */
	public List<PlaylistFolderVo> modalListPage(int startRnum, int endRnum, int playlistNo) {
		
		System.out.println("PlaylistFolderDao.modalPage");
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		map.put("playlistNo", playlistNo);
		
		System.out.println("startRnum: " + startRnum + ", endRnum: " + endRnum + ", playlistNo: " + playlistNo);
		
		List<PlaylistFolderVo> playlistPage = sqlSession.selectList("playlistFolder.modalPage4", map);
		System.out.println("modalListPage: " + playlistPage);
		
		return playlistPage;
	}
	
	/* 전체 글갯수 가져오기 */
	public int selectTotal(int playlistNo) {
		System.out.println("PlaylistFolderDao.selectTotal");
		int totalCnt = sqlSession.selectOne("playlistFolder.totalCnt", playlistNo);
		return totalCnt;
		
	}
	
	public int selectTotalSearchReview(int playlistNo, String search) {
		System.out.println("PlaylistFolderDao.selectTotalSearchReview");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("playlistNo", playlistNo);
		map.put("search", search);
		
		return sqlSession.selectOne("playlistFolder.totalCntSearchReview2", map);
	}
	
	/* 플리 검색 결과 가져오기 */
	public List<PlaylistFolderVo> getSearchResult(int startNum, int endNum, int playlistNo, String search) {
		
		System.out.println("PlaylistFolderDao.getSearchResult");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("playlistNo", playlistNo);
		map.put("search", search);
		
		List<PlaylistFolderVo> searchResult = sqlSession.selectList("playlistFolder.playlistSearch3", map);
		
		//System.out.println("검색 결과 : "+searchResult);
		
		return searchResult;
	}
	
	/* 선택 서평 등록하기 */
	public int reviewsInsert(PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("PlaylistFolderDao.reviewsInsert");
		
		int addVo = sqlSession.insert("playlistFolder.reviewsInsert",playlistFolderVo);

		return addVo;
	}
	
	/* 서평 삭제 */
	public int reviewDelete(int reviewNo) {
		
		System.out.println("PlaylistFolderDao.reviewDelete");
		
		int deleteResult = sqlSession.delete("playlistFolder.reviewDelete",reviewNo);
		System.out.println("삭제 성공 여부:"+deleteResult);
		return deleteResult;
		
	}
	
	/* 로딩시 좋아요 체크 */
	public int checkPlyAlreadyLiked(PlaylistFolderVo playlistFolderVo) {	
		
		System.out.println("PlaylistFolderDao.checkPlyAlreadyLiked");

		int checkLike = sqlSession.selectOne("playlistFolder.checkPlyAlreadyLiked",playlistFolderVo);

		return checkLike;
		
	}
	
	/* 해당 플리 좋아요 취소 */
	public int playlistUnlike(PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("PlaylistFolderDao.playlistUnlike");
		int unlikeResult = sqlSession.delete("playlistFolder.playlistUnlike",playlistFolderVo);
		System.out.println("좋아요 취소:"+unlikeResult);
		
		return unlikeResult;
		
	}
	
	/* 해당 플리 좋아요 */
	public int playlistlike(PlaylistFolderVo playlistFolderVo) {
		System.out.println("PlaylistFolderDao.playlistlike");
		int likeResult = sqlSession.insert("playlistFolder.playlistlike",playlistFolderVo);
		System.out.println("플리 좋아요:"+likeResult);
		
		return likeResult;
	}
	
	/* 서평 좋아요 */
	/*
	public void toggleLikeReview(LikeReviewVo reviewVo) {
		System.out.println("Dao.toggleLikeReview");

		Map<String, Integer> map = new HashMap<>();
		map.put("reviewNo", reviewVo.getReviewNo());
		map.put("userNo", reviewVo.getUserNo());
		
		// pl/sql는 return 하는 값이 없다 (query가 아니라 procedure이기 때문)
		sqlSession.insert("playlistFolder.toggleLikeReview", map);
		
		System.out.println("--sqlSession.toggleLikeReview");
	}
	
	public int checkToggleLike(LikeReviewVo reviewVo) {
		System.out.println("Dao.checkToggleLike");
		
		return sqlSession.selectOne("playlistFolder.checkToggleLike", reviewVo);
	}
	*/
	public int likeReview(LikeReviewVo reviewVo) {
		
		System.out.println("reviewVo: " + reviewVo);
				
		int result = sqlSession.insert("playlistFolder.likeReview", reviewVo);
		
		System.out.println(result + "건 | 서평 좋아요");
		
		return result;
	}
	
	public int cancelLikeReview(LikeReviewVo reviewVo) {
		
		System.out.println("reviewVo: " + reviewVo);
		
		int result = sqlSession.delete("playlistFolder.cancelLikeReview", reviewVo);
		
		System.out.println(result + "건 |  서평 좋아요 취소");
		
		return result;
	}
	
	/* 서평 삭제 */
	public int deleteReview(int reviewNo, int playlistNo) {
		System.out.println("PlaylistFolderDao.deleteReview");
		
		Map<String, Integer> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("playlistNo", playlistNo);
		
		int result = sqlSession.delete("playlistFolder.deleteReview", map);
		
		System.out.println(result + "건 : " + playlistNo + "번 플리에서 " + reviewNo + "번 서평 삭제");
		
		return result;
	}
}
