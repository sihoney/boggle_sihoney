package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.LikeReviewService;
import com.javaex.service.UserService;
import com.javaex.vo.LikeReviewVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="")
public class LikeReviewController {

	//field
	@Autowired
	private UserService userService;
	@Autowired
	private LikeReviewService likeReviewService;
	
	//취향저격(좋아요한서평페이지)
		@RequestMapping("/{nickname}/tastereview")
		public String tastereview(@PathVariable(value="nickname") String nickname,
							   HttpSession session, Model model) {
			System.out.println("likereview");
			
			String yours = ((UserVo)session.getAttribute("authUser")).getNickname();
			System.out.println("로그인사람의 닉네임 : "+yours);
			System.out.println("닉네임 :" +nickname);
			
			String result = "likeUser";
			System.out.println(result);
			
			model.addAttribute("result", result);
			
			int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
			System.out.println("유저넘버"+userNo+"의 리스트");
			
			List<LikeReviewVo> lrList = likeReviewService.list(userNo);
			
			model.addAttribute("lrList", lrList);
			
			return "taste/review";		
		}
}
