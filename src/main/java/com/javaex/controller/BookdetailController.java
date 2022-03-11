package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BookdetailService;
import com.javaex.vo.BookdetailVo;
import com.javaex.vo.ReviewVo;

@Controller
@RequestMapping("/bookdetail")
public class BookdetailController {
	
	/* 필드 */
	@Autowired
	private BookdetailService bookdetailService;
	
	/* 책 상세페이지 */
	@RequestMapping("")
	public String bookDetail(@RequestParam("bookNo") String bookNo,
							Model model) {
		
		System.out.println(bookNo);
		System.out.println("Controller.bookdetail");
		
		//서평 리스트
		List<ReviewVo> reviewList = bookdetailService.getReviewList(bookNo);
		System.out.println(reviewList);
		
		//책 정보
		BookdetailVo bookVo = bookdetailService.getBookVo(bookNo);
		System.out.println("controller: "+ bookVo);
		
		//해당 서평 총 수 
		int bookReviewCount = bookdetailService.getCount(bookNo);
		System.out.println(bookReviewCount);
	
		Map<String, Object> bookMap = new HashMap<String, Object>();
		bookMap.put("reviewList", reviewList);
		bookMap.put("bookVo", bookVo);
		bookMap.put("bookReviewCount", bookReviewCount);

		//데이터 보내기
		model.addAttribute("bookMap",bookMap);
		
		return "book_detail/book_detail";
	}

}
