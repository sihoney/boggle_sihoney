package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	
	@RequestMapping("/main")
	public String bookDetail() {
		System.out.println("main");
		
		return "main/main";
	}

}
