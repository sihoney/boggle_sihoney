package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mybook")
public class MybookController {
	
	@RequestMapping("/{id}")
	public String myreview() {
		System.out.println("mybook");
		
		return "mybook/mybook_review";
	}
	
	
}
