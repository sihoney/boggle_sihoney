package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.PlaylistFolderService;
import com.javaex.vo.PlaylistFolderVo;

@Controller
@RequestMapping("/playlist")
public class PlaylistFolderController {
	
	@Autowired
	private PlaylistFolderService playlistfolderService;
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트  */
	@RequestMapping("/folder")
	public String playlistFolder(@RequestParam("playlistNo") int playlistNo,
								 @RequestParam("userNo") int userNo,
								 Model model) {
		
		System.out.println("Controller.playlistFolder");
		System.out.println(playlistNo);

		//플레이리스트 번호 받기
		//해당 폴더 서평리스트 가져오기
		Map<String, Object> playlistVo = playlistfolderService.playlistReviewList(playlistNo, userNo);
		System.out.println("controller: "+playlistVo);

		//데이터 보내기
		model.addAttribute("playlistVo",playlistVo);
		
		return "taste/click-playlist";
		
	}
	
	/* 플리 모달 페이징+리스트 */
	@ResponseBody
	@RequestMapping("/modalListPage")
	public Map<String, Object> modalListPage(@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage) {
		
		System.out.println("Controller.modalListPage");
		System.out.println(crtPage);
		
		//해당페이지의 글 리스트 5개
		Map<String, Object> playlistMap = playlistfolderService.madalListPage(crtPage);
		System.out.println(playlistMap);
		
		
		return playlistMap;
	}
	
	
	/* 플리 모달 검색창 */
	@ResponseBody
	@RequestMapping("/reviewSearch")
	public List<PlaylistFolderVo> reviewSearch(@RequestParam(value="SearchTxt") String searchTxt ) {
		
		System.out.println("Controller.reviewSearch");
		System.out.println(searchTxt);
		
		List<PlaylistFolderVo> searchResult = playlistfolderService.getSearchResult(searchTxt);
		System.out.println("컨트롤러:"+searchResult);
		
		
		return searchResult;
	}
	
	/* 플리 모달 추가 선택 등록 */
	@ResponseBody
	@RequestMapping("/addReviews")
	public String addReviews() {
		
		System.out.println("Controller.addReviews");
		
		return "";
	}
	
	
	

}
