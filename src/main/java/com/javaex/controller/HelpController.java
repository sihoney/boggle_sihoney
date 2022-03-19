package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/help")
public class HelpController {
	
	
	@RequestMapping("")
	public String help() {
		System.out.println("help");
		
		return "help/help";
	}
	
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		System.out.println("writeForm");
		
		return "help/writeForm";
	}
	
	@RequestMapping("/list")
	public String list() {
		System.out.println("list");
		
		return "help/list";
	}
	@RequestMapping("/read")
	public String read() {
		System.out.println("read");
		
		return "help/read";
	}
	

	@RequestMapping("/modifyForm")
	public String modifyForm() {
		System.out.println("modifyForm");
		
		return "help/modifyForm";
	}
	
	@RequestMapping("/legal")
	public String legal() {
		System.out.println("legal");
		
		return "help/legal";
	}
	
	@RequestMapping("/privacy")
	public String privacy() {
		System.out.println("privacy");
		
		return "help/privacy";
	}
	
	@RequestMapping("/youth")
	public String youth() {
		System.out.println("youth");
		
		return "help/youth";
	}
	
	

}
