package com.javaex.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.ReviewWriteService;
import com.javaex.util.HttpUtil;

@Controller
@RequestMapping("review_write")
public class ReviewWriteController {

	@Autowired
	ReviewWriteService reviewWriteService;
	
	@ResponseBody
	@RequestMapping(value="searchbook", method = {RequestMethod.GET, RequestMethod.POST}, produces="applicatioin/json;charset=UTF-8")
	public String searchbook(@RequestParam String query, 
							 @RequestParam(value="crtPage", required=false, defaultValue="1") String crtPage) throws IOException {
		System.out.println("ReviewWriteController > searchbook()");
		
		///////////////////////
		// API
		///////////////////////
		
		String key = "ttbmay-primavera1830001";
		
		HashMap<String, Object> result = new HttpUtil()
				.url("http://www.aladin.co.kr/ttb/api/ItemSearch.aspx")
				.method("get")
				.queryString("TTBKey", key)
				.queryString("query", query)
				.queryString("output", "js")
				.queryString("MaxResults", "4")
				.queryString("Start", crtPage)
				.build();
		
		String jsonStr = result.get("body").toString();
		jsonStr = jsonStr.substring(0, jsonStr.length() - 1);
		
		Object status = result.get("status");
		Object header = result.get("header");
		
		///////////////////////
		// review total cnt 추가하기
		///////////////////////
		
		JSONObject jsonObj = new JSONObject(jsonStr);
		
		JSONArray items = jsonObj.getJSONArray("item");

		List<Object> list = reviewWriteService.addReviewTotalCnt(items);
		
		///////////////////////////////
		// json --> java data type
		///////////////////////////////

		ObjectMapper objectMapper = new ObjectMapper();

		///////////////////////
		// 페이징
		///////////////////////
		
		// 페이지 당 버튼 개수
		int pageBtnCnt = 5;
		
		// 마지막 버튼 번호
		int endBtnNo = (int) (Math.ceil(Integer.parseInt(crtPage) / (double)pageBtnCnt)) * pageBtnCnt;
		
		// 시작 버튼 번호
		int startBtnNo = endBtnNo - (pageBtnCnt - 1);		
		
		///////////////////////
		// mapping
		///////////////////////
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("endBtnNo", endBtnNo);
		map.put("startBtnNo", startBtnNo);
		map.put("list", list);
		
		String str = objectMapper.writeValueAsString(map);
		
		return str;
	}
}
