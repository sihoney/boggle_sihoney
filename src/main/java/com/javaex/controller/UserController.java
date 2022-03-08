package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	//필드
	@Autowired
	private UserService userService;
	
	
	/* 로그인폼 */
	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("UserController>loginForm");
		
		return "user/loginForm";
	}
	
	/* 로그인 */
	@RequestMapping("/login")
	public String login(Model model,
						@ModelAttribute UserVo userVo,
						HttpSession session) {
		System.out.println("UserController>login");
		
		//유저 이메일, 패스워드 넣으면 넘버, 이름 주는 메소드
		UserVo authUser = userService.login(userVo);
		System.out.println("authUser : "+authUser);
		
		//로그인 성공여부 확인
		if(authUser != null) {
			//로그인 성공시
			System.out.println("로그인성공");
			
			//세션에 저장
			session.setAttribute("authUser", authUser);
			
			//리다이렉트
			return "redirect:/";
		}else {
			System.out.println("로그인실패");
			
			String result = "fail";
			model.addAttribute("result", result);
			
			return "redirect:/user/loginForm";
		}
	}
	
	/* 로그아웃 */
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) {
		
		System.out.println("UserController>logout");
		
		//세션정보 삭제
		httpSession.removeAttribute("authUser");
		httpSession.invalidate();
		
		return "redirect:/";
	}
	
	
	/* 회원가입 */
	@RequestMapping("/joinForm")
	public String joinForm() {
		System.out.println("joinForm");
		
		return "user/joinForm";
	}
	
	
	/* 회원정보수정 */
	@RequestMapping("/user_modify")
	public String user_modify() {
		System.out.println("user_modify");
		
		return "user/user_modify";
	}
	
	
	
	

}
