package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MusicVo;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.ReviewVo;

@Repository
public class MainDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> getEmotion(){
		System.out.println("EmotionDao.getEmotion()");
		
		List<Map<String, Object>> list =  sqlSession.selectList("emotion.getEmotion");
		
		return list;
	}

	public List<ReviewVo> getReviewListByEmo(int emoNum) {
		System.out.println("EmotionDao.getReviewListByEmo()");
		
		List<ReviewVo> list =  sqlSession.selectList("emotion.getReviewListByEmo", emoNum);
		
		return list;
	}
	
	public List<ReviewVo> getReviewListByPly(int playlistNo) {
		List<ReviewVo> list = sqlSession.selectList("emotion.getReviewListByPly", playlistNo);
		
		System.out.println(list);
		
		return list;
	}
	
	
	public List<MusicVo> getMusicListByEmo(int emoNo) {
		System.out.println("EmotionDao.getMusicListByEmo()");
		
		List<MusicVo> list = sqlSession.selectList("emotion.getMusicListByEmo", emoNo);
		
		return list;
	}
	
	public int getMusicTotalCnt(int emoNo) {
		int totalCnt = sqlSession.selectOne("emotion.getMusicTotalCnt", emoNo);

		return totalCnt;
	}
	
	public List<PlaylistVo> getMyPlaylist(int userNo) {
		List<PlaylistVo> list = sqlSession.selectList("emotion.getMyPlaylist", userNo);
		
		return list;
	}
	
	public void addNewPlaylist(PlaylistVo pvo) {
		sqlSession.insert("emotion.addNewPlaylist", pvo);
		
		System.out.println(pvo);
	}
	
	public int addNewPlaylistAtUser(PlaylistVo pvo) {
		return sqlSession.insert("emotion.addNewPlaylistAtUser", pvo);
	}
	
	public void addReviewToPly(Map<String, Object> map) {
		int result = sqlSession.insert("emotion.addReviewToPly", map);
		System.out.println(result + "건 : 리뷰를 플리에 저장");
	}
	
	public void deleteReviewFromPly(Map<String, Object> map) {
		System.out.println(map);
		int result = sqlSession.delete("emotion.deleteReviewFromPly", map);
		System.out.println(result + "건 : 리뷰를 플리에서 삭제");
	}
	
	public int alreadyAdded(Map<String, Object> map) {
		int result =  sqlSession.selectOne("emotion.alreadyAdded", map);
		
		return result;
	}
	
}
