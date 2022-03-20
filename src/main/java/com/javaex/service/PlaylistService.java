package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.dao.PlaylistDao;
import com.javaex.vo.PlaylistVo;

@Repository
public class PlaylistService {
	
	//필드
	@Autowired
	private PlaylistDao playlistDao; 
	
	
	public List<PlaylistVo> likelist(int userNo){
		
		List<PlaylistVo> likeplay = playlistDao.likelist(userNo);
		
		return likeplay;
	}
}
