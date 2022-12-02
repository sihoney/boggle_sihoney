package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PlaylistClickDao;
import com.javaex.vo.PlaylistClickVo;

@Service
public class PlaylistClickService{
	
	//field
	@Autowired
	private PlaylistClickDao playlistClickDao;
	
	//좋아요한 플레이리스트 리스트출력
	public List<PlaylistClickVo> likelistclick (int userNo){
		System.out.println("PlaylistClickService.liked list");
		
		List<PlaylistClickVo> likeplayclick = playlistClickDao.likelistclick(userNo);
	
		System.out.println("총 개수: " + likeplayclick.size());
		
		return likeplayclick;
	}
	
	public List<PlaylistClickVo> popularlistclick(){
		System.out.println("PlaylistClickService.popular list");
		
		List<PlaylistClickVo> popularplayclick = playlistClickDao.popularlistclick(); 
	
		System.out.println("총 개수: " + popularplayclick.size());
		
		return popularplayclick;
	}
	
	public List<PlaylistClickVo> makelistclick(int userNo){
		System.out.println("PlaylistClickService.maked list");
		
		List<PlaylistClickVo> makelistclick = playlistClickDao.makelistclick(userNo);
		
		System.out.println("총 개수: " + makelistclick.size());
		
		return makelistclick;
	}
}
