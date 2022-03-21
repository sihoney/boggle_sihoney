package com.javaex.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.ReviewWriteService;
import com.javaex.util.HttpUtil;
import com.javaex.vo.StyleVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/review")
public class ReviewWriteController {

	@Autowired
	ReviewWriteService reviewWriteService;
	
	@RequestMapping("/write")
   public String review_write() {
      System.out.println("write");
      
      return "review_write/review_write";
   }
	
	
	@ResponseBody
	@RequestMapping(value="/searchbook", method = {RequestMethod.GET, RequestMethod.POST}, produces="applicatioin/json;charset=UTF-8")
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
	
	@ResponseBody
	@RequestMapping("/getStyle")
	public List<StyleVo> getStyle(@RequestParam(value="emoNo") int emoNo) {
		System.out.println("ReviewWriteController > getStyle");
		
		return reviewWriteService.getStyle(emoNo);
	}
	
	@ResponseBody
	@RequestMapping("/addReview")
	public Map<String, String> addReview(@RequestBody Map<String, Object> map,
							HttpSession session) throws JsonProcessingException {
		System.out.println("ReviewWriteController > addReview");
	
		System.out.println(map);
		//{userNo=6, styleNo=5, reviewContent=심심ㅅ밋밋ㅁ, bookNo=9791156937050, bookTitle=2023 행선집 : 로이어스 행정법 선택형 집중 - 변시 11회와 변모 최근 3년치 선택형 해설 수록, author=김태성 지음, genreName=국내도서>수험서/자격증>인문/사회/법(고등고시)>변호사시험>행정법, coverURL=https://image.aladin.co.kr/product/29104/81/coversum/k452837162_1.jpg, genreNo=34791}

		reviewWriteService.addReview(map);
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		String redirect;
		
		if(authUser == null) {
			redirect = "user/loginForm";
		} else {
			ObjectMapper objectMapper = new ObjectMapper();
			String nickname = objectMapper.writeValueAsString(authUser.getNickname());
			
			redirect = nickname;
		}
		
		System.out.println(redirect);
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("redirect", redirect);
		
		return resultMap;
	}
}
