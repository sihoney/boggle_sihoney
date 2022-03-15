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
import com.javaex.vo.BookreviewVo;

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
	
	/* 해당 플레이리스트 폴더에 서평 추가하기 */
	@ResponseBody
	@RequestMapping("/reviewModalList")
	public List<BookreviewVo> reviewModalList() {
		
		System.out.println("Controller.reviewModalList");
		List<BookreviewVo> reviewListAll = playlistfolderService.ReviewListSelect();
		System.out.println(reviewListAll);
		
		return reviewListAll;
		
	}

}
