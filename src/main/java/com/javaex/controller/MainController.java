package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MainService;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.ReviewVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("")
	public String bookDetail() {
		System.out.println("main");
		
		return "main/main";
	}
	
	// emotion tag 리스트 가져오기
	@ResponseBody
	@RequestMapping("/getemotion")
	public List<Map<String, Object>> getEmotion() {
		System.out.println("MainController > getEmotion()");
		
		return mainService.getEmotion();
	}
	
	@ResponseBody
	@RequestMapping("/reviewListByEmo") //reviemusiclist?playlistNo=
	public Map<String, Object> getReviewListByEmo(@RequestParam(value="emoNo", required=false) Integer emoNo,
												  @RequestParam(value="playlistNo", required=false) Integer playlistNo) {
		System.out.println("MainController > getReviewListByEmo()");
		// defaultValue=Math.ramdom() 으로 디폴트 플리 설정해도 좋을 것 같다
		
		return mainService.getReviewListByEmo(emoNo, playlistNo);
	}
	
	@ResponseBody
	@RequestMapping("/getMyPlaylist")
	public List<PlaylistVo> getMyPlaylist(@RequestParam(value="userNo") int userNo) {
		System.out.println("MainController > getMyPlaylist");
		
		return mainService.getMyPlaylist(userNo);
	}
	
	@ResponseBody
	@RequestMapping("/getMyPlaylistModal")
	public List<Map<String, Object>> getMyPlaylistModal(@RequestBody ReviewVo reviewVo) { 
		System.out.println("MainController > getMyPlaylistModal");
		
		List<Map<String, Object>> modalPlaylist = mainService.getMyPlaylistModal(reviewVo);
		return modalPlaylist;
	}
	
	@ResponseBody
	@RequestMapping("/addReviewToPly")
	public void addReviewToPly(@RequestBody Map<String, Object> map) {
		System.out.println("MainController > addReviewToPly");
		
		mainService.toggleReviewToPly(map);
	}
	
	@ResponseBody
	@RequestMapping("/addNewPlaylist")
	public int addNewPlaylist(@RequestBody PlaylistVo pvo) {
		System.out.println("MainController > addNewPlaylist");
		
		return mainService.addNewPlaylist(pvo);
	}

}
