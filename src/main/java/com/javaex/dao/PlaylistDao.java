package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PlaylistVo;

@Repository
public class PlaylistDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<PlaylistVo> likelist(int userNo){
		
		List<PlaylistVo> likeplay = sqlSession.selectList("playlist.likelist", userNo);
		
		return likeplay;
	}
}
