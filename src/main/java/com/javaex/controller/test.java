package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class test {
	
	@RequestMapping("")
	public String bookDetail() {
		System.out.println("main");
		
		return "main/main";
	}
	
	@RequestMapping("/analyze")
	public String analyze() {
		System.out.println("user_analyze");
		
		return "analyze/user_analyze";
	}
	
	@RequestMapping("/bookdetail")
	public String bookdetail() {
		System.out.println("book_detail");
		
		return "book_detail/book_detail";
	}
	
	@RequestMapping("/mybook")
	public String mybook() {
		System.out.println("mybook");
		
		return "mybook/mybook_review";
	}
	
	@RequestMapping("/imgpreview")
	public String imgpreview() {
		System.out.println("image_preview");
		
		return "mybook/image_preview";
	}
	
	@RequestMapping("/review_write")
	public String review_write() {
		System.out.println("review_write");
		
		return "review_write/review_write";
	}

}
