package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.dao.BookmarkDao;
import com.javaex.vo.BookmarkVo;

@Repository
public class BookmarkService {

	// field
	@Autowired
	private BookmarkDao bookmarkDao;

//	public Map<String, Object> getBmist(int bookNo, int userNo) {
//
//		// 책 리스트
//		List<BookmarkVo> bList = bookmarkDao.getBList(bookNo);
//		
//		// 선택한 북상세
//		BookmarkVo bmList = bookmarkDao.getBmList(bookNo, userNo);
//
//		//데이터 모아주기 
//		Map<String, Object> bmVo = new HashMap<String, Object>();
//		bmVo.put("bList", bmList);
//		bmVo.put("bmList", bmList);
//
//		return bmVo;
//	}
//}

//	// 유저 번호 입력시 해당유저 북마크 리스트 출력
	public List<BookmarkVo> getBMList(int userNo) {
		System.out.println("Service.getBookmarkList");
	
		List<BookmarkVo> bmList = bookmarkDao.getBMList(userNo);
		return bmList;
	}
}
