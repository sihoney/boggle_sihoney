package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.MybookService;
import com.javaex.service.PlaylistService;
import com.javaex.service.UserService;
import com.javaex.vo.MybookVo;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "")
public class TasteController {

	// 필드
	@Autowired
	private MybookService mybookService;
	@Autowired
	private UserService userService;
	@Autowired
	private PlaylistService playlistService;

	// 취향저격(main페이지)
	@RequestMapping("/{nickname}/tastemain")
	public String tastemain(@PathVariable(value = "nickname") String nickname, HttpSession session, Model model) {

		System.out.println("tastemain");

		// 세션의 닉네임
		String yours = ((UserVo) session.getAttribute("authUser")).getNickname();
		System.out.println("로그인사람의 닉네임 : " + yours);
		System.out.println("지금 서재 닉네임 : " + nickname);

		// 세션아이디랑 지금 블로그닉네임이 같니?
		if (nickname.equals(yours)) {

			String result = "sameUser";
			System.out.println(result);

			// result 값 보내주기
			model.addAttribute("result", result);

			// 세션아이디의 유저넘버
			int userNo = ((UserVo) session.getAttribute("authUser")).getUserNo();

			//해당유저 넘버를 주면 좋아요한 서평을 출력하는 메소드
			List<MybookVo> like1 = mybookService.likereview(userNo);
			model.addAttribute("like1", like1);
			
			//해당유저 넘버를 주면 좋아요한 서평리스트를 출력하는 메소드+해당유저의 서평 총 갯수 출력
			List<MybookVo> likelist = mybookService.likelist(userNo);
			model.addAttribute("likelist", likelist);
			
			//해당유저 넘버를 주면 좋아요한 플레이리스트를 출력하는 메소드
			List<PlaylistVo> likeplay = playlistService.likelist(userNo);

		} else {

			String result = nickname;
			System.out.println("anotherUser");

			// result 값 보내주기
			model.addAttribute("result", result);

			// 지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
			UserVo otherUser = userService.getUser(nickname);
			int userNo = otherUser.getUserNo();
			
			//해당유저 넘버를 주면 좋아요한 서평을 출력하는 메소드
			List<MybookVo> like1 = mybookService.likereview(userNo);
			model.addAttribute("like1", like1);
			
			//해당유저 넘버를 주면 좋아요한 서평리스트를 출력하는 메소드+해당유저의 서평 총 갯수 출력
			List<MybookVo> likelist = mybookService.likelist(userNo);
			model.addAttribute("likelist", likelist);
			
			//해당유저 넘버를 주면 좋아요한 플레이리스트를 출력하는 메소드
			List<PlaylistVo> likeplay = playlistService.likelist(userNo);
			model.addAttribute("likeplay", likeplay);
			
		}

		return "taste/taste-main";
	}

}
