package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BookdetailDao;
import com.javaex.vo.BookdetailVo;
import com.javaex.vo.ReviewVo;

@Service
public class BookdetailService {
	
	@Autowired
	private BookdetailDao bookdetailDao;

	/* 해당 책 서평 리스트 */
	public List<ReviewVo> getReviewList(String bookNo) {

		System.out.println("Service.getReviewList");
		return bookdetailDao.getReviewList(bookNo);

	}
	
	/* 해당 책 정보 */
	public BookdetailVo getBookVo(String bookNo) {

		System.out.println("Service.getBookVo");
		return bookdetailDao.getBookVo(bookNo);

	}
	
	/* 해당 책 총 서평 수 */ 
	public int getCount(String bookNo) {
		
		System.out.println("Service.getCount");
		int getCount = bookdetailDao.getCount(bookNo);
		
		return getCount;
	}

}
