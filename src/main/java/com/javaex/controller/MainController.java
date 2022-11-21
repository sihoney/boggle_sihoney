package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MainService;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.ReviewVo;
import com.javaex.vo.UserVo;


@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	// 홈 페이지
	@RequestMapping("")
	public String main(Model model,
						HttpSession session) { // bookDetail --> main
		System.out.println("MainController.main()");
		
		// 감정 태그
		List<Map<String, Object>> emoList = mainService.getEmotion();
		model.addAttribute("emoList", emoList);
		
		// 로그인 상태 -> 플리 가져오기
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		if(authUser != null) { // 로그인된 상태라면
			List<PlaylistVo> myPlaylist = mainService.getMyPlaylist(authUser.getUserNo());
			model.addAttribute("myPlaylist", myPlaylist);
		}
		
		return "main/main";
	}	

	// 서평작성 페이지에서 사용!
	@ResponseBody
	@RequestMapping("/getemotion")
	public List<Map<String, Object>> getEmotion() {
		System.out.println("MainController > getEmotion()");
		
		return mainService.getEmotion();
	}

	@ResponseBody
	@RequestMapping("/reviewmusiclist") 
	public Map<String, Object> getReviewList(@RequestParam(value="emoNo", required=false) String emoNo,
											 @RequestParam(value="playlistNo", required=false) Integer playlistNo,
											 @RequestParam(value="userNo", required=false) String userNo) {
		System.out.println("MainController.getReviewList()");

		System.out.println("--userNo: " + userNo);
		System.out.println("--emoNo: " + emoNo);
		System.out.println("--plyNo: " + playlistNo);

		if(emoNo == null) {
			emoNo = "null";
		}
		
		Integer emoNoInt = null;
		if( !"null".equals(emoNo) ) {
			System.out.println("감정 분류 리스트 불러오겠습니다.");
			emoNoInt = Integer.parseInt(emoNo);
		}

		Integer userNoInt = null;
		if( !userNo.equals("undefined") && !userNo.equals("null") ) {
			System.out.println("로그인 상태");
			userNoInt = Integer.parseInt(userNo);
		} 

		return mainService.getReviewList(userNoInt, emoNoInt, playlistNo);
		
	}

	@ResponseBody
	@RequestMapping("/getMyPlaylistModal")
	public List<Map<String, Object>> getMyPlaylistModal(@RequestBody ReviewVo reviewVo) { 
		System.out.println("MainController.getMyPlaylistModal");
		
		List<Map<String, Object>> modalPlaylist = mainService.getMyPlaylistModal(reviewVo);
		return modalPlaylist;
	}
	
	@ResponseBody
	@RequestMapping("/toggleReviewToPly")
	public Integer toggleReviewToPly(@RequestBody Map<String, Object> map) {
		System.out.println("MainController.toggleReviewToPly");
		
		return mainService.toggleReviewToPly(map);
	}
	
	@ResponseBody
	@RequestMapping("/addNewPlaylist")
	public int addNewPlaylist(@RequestBody PlaylistVo pvo) { // userNo, playlistName, emoNo
		System.out.println("MainController.addNewPlaylist" + pvo);
		
		return mainService.addNewPlaylist(pvo);
	}
	
	@ResponseBody
	@RequestMapping("/toggleReviewLike")	
	public Map<String, String> toggleReviewLike(@RequestBody ReviewVo reviewVo) { // reviewNo, userNo
		System.out.println("MainController.toggleReviewLike");
		
		String result = mainService.toggleReviewLike(reviewVo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		
		return map;
	}
}