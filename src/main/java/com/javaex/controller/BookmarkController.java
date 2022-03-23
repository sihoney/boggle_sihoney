package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.BookmarkService;
import com.javaex.service.UserService;
import com.javaex.vo.BookmarkVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="")
public class BookmarkController {

	// field
	@Autowired
	private BookmarkService bookmarkService;
	@Autowired
	private UserService userService;

	// 리스트 출력 기능
	@RequestMapping("/{nickname}/main_book")

	public String list(@PathVariable(value="nickname")String nickname,
					HttpSession session, Model model) {
		//int userNo = ((UserVo)session.getAttribute("authUser").getUserNo();
		int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo(); 
		
		System.out.println(userNo+"의 북마크");
		List<BookmarkVo> bmList = bookmarkService.getBMList(userNo);
		System.out.println(bmList);
		
		model.addAttribute("bmList", bmList);
		
		return "taste/main-book";
	}
}
