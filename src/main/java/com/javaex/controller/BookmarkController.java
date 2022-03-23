package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BookmarkService;
import com.javaex.service.UserService;
import com.javaex.vo.BookmarkVo;

@Controller
@RequestMapping(value = "")
public class BookmarkController {

	// field
	@Autowired
	private BookmarkService bookmarkService;
	@Autowired
	private UserService userService;

	// 리스트 출력 기능
	@RequestMapping("/bookmark")

	public String list(@RequestParam("userNo")int userNo,
					HttpSession session, Model model) {
		//int userNo = ((UserVo)session.getAttribute("authUser").getUserNo();
		
		System.out.println(userNo+"의 북마크");
		List<BookmarkVo> bmList = bookmarkService.getBMList(userNo);
		System.out.println(bmList);
		
		model.addAttribute("bmList", bmList);
		
		return "taste/main-book";
	}
}
