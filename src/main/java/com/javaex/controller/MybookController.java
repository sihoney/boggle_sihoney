package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.MybookService;
import com.javaex.service.UserService;
import com.javaex.vo.MybookVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="")
public class MybookController {
	
	
	//필드
	@Autowired
	private MybookService mybookService;
	private UserService userService;
	
	//내가 로그인한 상태에서 블로그 상태
	@RequestMapping("/{nickname}")
	public String myreview(@PathVariable(value="nickname") String nickname,
						   HttpSession session, Model model) {
		System.out.println("mybook");
		
		//세션의 닉네임
		String yours = ((UserVo)session.getAttribute("authUser")).getNickname();
		System.out.println("로그인사람의 닉네임 : "+yours);
		System.out.println("지금 서재 닉네임 : "+nickname);
		
		//세션아이디의 유저넘버
		int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo(); 
		
		//세션아이디랑 지금 블로그닉네임이 같니?
		if(nickname.equals(yours)) {
			
			String result = "sameUser";
			System.out.println(result);
			
			//result 값 보내주기
			model.addAttribute("result", result);
			
			//서평리스트출력
			//유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
			System.out.println("유저넘버"+userNo+"의 리스트");
			
			List<MybookVo> mbList =  mybookService.list(userNo);
			
			//모델로 보내기
			model.addAttribute("mbList", mbList);			
			
			return "mybook/mybook_review";
			
		}else {
			
			String result = nickname;
			System.out.println("anotherUser");
			
			//result 값 보내주기
			model.addAttribute("result", result);
			
			//지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
			UserVo otherUser = userService.getUser(nickname);
			
			//유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
			
			//모델로 보내기
			
			return "mybook/mybook_review";
		}
		
		
	}
	
	
}