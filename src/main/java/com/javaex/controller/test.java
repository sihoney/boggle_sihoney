package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	
	@RequestMapping("/book_detail")
	public String bookDetail() {
		System.out.println("book_detail");
		
		return "book_detail/book_detail";
	}

}
