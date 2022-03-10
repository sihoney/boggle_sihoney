package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/{id}")
public class MybookController {
	
	//내블로그
	@RequestMapping("")
	public String myreview(@PathVariable(value="id") String id) {
		System.out.println("mybook");
		
		//세션아이디 받아서 보내주기
		
		return "mybook/mybook_review";
	}
	
	
}
