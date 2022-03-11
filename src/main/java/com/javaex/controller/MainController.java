package com.javaex.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.MainService;
import com.javaex.vo.ReviewVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("")
	public String bookDetail() {
		System.out.println("main");
		
		return "main/main";
	}
	
	// emotion tag 리스트 가져오기
	@ResponseBody
	@RequestMapping("/getemotion")
	public List<Map<String, Object>> getEmotion() {
		System.out.println("MainController > getEmotion()");
		
		return mainService.getEmotion();
	}
	
	// review 리스트 (emotion tag 클릭 했을 때)
	@ResponseBody
	@RequestMapping("/getReviewListByEmo")
	public List<ReviewVo> getReviewListByEmo(@RequestBody String emoNo) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("MainController > getReviewListByEmo()");
		
		ObjectMapper mapper = new ObjectMapper();
		
		@SuppressWarnings("unchecked")
		Map<String, String> map = mapper.readValue(emoNo, Map.class);

		int emoNum = Integer.parseInt( map.get("emoNo"));

		return mainService.getReviewListByEmo(emoNum);
	}
}
