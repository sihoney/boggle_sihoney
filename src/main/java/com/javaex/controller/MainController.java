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
		
		if(authUser != null) { // 로그인된 상태라면 플레이리스트 담기
			List<PlaylistVo> myPlaylist = mainService.getMyPlaylist(authUser.getUserNo());
			model.addAttribute("myPlaylist", myPlaylist);
		}
		
		return "main/main";
	}	

	// 서평작성 페이지에서 사용!(review_write)
	@ResponseBody
	@RequestMapping("/getemotion")
	public List<Map<String, Object>> getEmotion() {
		System.out.println("MainController > getEmotion()");
		
		return mainService.getEmotion();
	}

	@ResponseBody
	@RequestMapping("/reviewmusiclist") 
	public Map<String, Object> getReviewList(@RequestParam(value="sort", required=false, defaultValue="emotion") String sort,
											 @RequestParam(value="no", required=false) Integer no,
											 HttpSession session) {
		System.out.println("MainController.getReviewList()");
		
		Integer userNo = null;
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser != null) {
			userNo = authUser.getUserNo();
		}
		
		System.out.println("--userNo: " + userNo);
		System.out.println("--sort: " + sort);
		System.out.println("--no: " + no);
		
		return mainService.getReviewList(userNo, sort, no);
	}

	@ResponseBody
	@RequestMapping("/getMyPlaylistModal")
	public List<Map<String, Object>> getMyPlaylistModal(@RequestBody ReviewVo reviewVo,
													    HttpSession session) { 
		System.out.println("MainController.getMyPlaylistModal");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return null;
		}
		reviewVo.setUserNo(authUser.getUserNo());
		
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
	public int addNewPlaylist(@RequestBody PlaylistVo pvo,
							  HttpSession session) { // playlistName, emoNo
		System.out.println("MainController.addNewPlaylist" + pvo);
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return -1;
		}
		pvo.setUserNo(authUser.getUserNo());
		
		return mainService.addNewPlaylist(pvo);
	}
	
	@ResponseBody
	@RequestMapping("/toggleReviewLike")	
	public Map<String, String> toggleReviewLike(@RequestBody ReviewVo reviewVo,
												HttpSession session) { // reviewNo
		System.out.println("MainController.toggleReviewLike");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return null;
		}
		reviewVo.setUserNo(authUser.getUserNo());
		
		String result = mainService.toggleReviewLike(reviewVo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		
		return map;
	}
}