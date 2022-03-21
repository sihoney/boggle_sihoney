package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.ReviewWriteDao;
import com.javaex.vo.StyleVo;

@Service
public class ReviewWriteService {

	@Autowired
	ReviewWriteDao reviewWriteDao;
	
	public List<Object> addReviewTotalCnt(JSONArray items) {
		System.out.println("ReviewWriteDao > addReviewTotalCnt()");
		
		for(int i = 0; i < items.length(); i++) {
			
			JSONObject item = items.getJSONObject(i); 
			
			System.out.println("item.has(\"isbn13\") : " + item.get("isbn13"));
			
			if(item.get("isbn13") != "") {
				System.out.println("item isbn13 isn't null");
				
				String isbn = (String) item.get("isbn13");
				
				Long isbn13 = Long.parseLong(isbn);

				int totalCnt = reviewWriteDao.getReviewTotalCnt(isbn13);
				
				items.getJSONObject(i).put("totalCnt", totalCnt);
			}

		}
		
		List<Object> list = items.toList();
		
		return list;
	}
	
	public List<StyleVo> getStyle(int emoNo) {
		return reviewWriteDao.getStyle(emoNo);
	}
	
	public int addReview(Map<String, Object> map) {
		
		// 0. 장르 테이블에 이미 저장되어 있는지 확인
		int result = reviewWriteDao.checkGenre(map);
		
		if(result == 0) {
			// 1. 장르 테이블 넣기
			reviewWriteDao.addGenre(map);
		}
		
		// 2-1. 책 저장되어 있는지 확인
		int result2 = reviewWriteDao.checkBook(map);
		
		if(result2 == 0) {
			// 2. books 테이블 넣기
			reviewWriteDao.addBook(map);
		}
		
		// 3. review 테이블에 넣기
		return reviewWriteDao.addReview(map);
	}
}
