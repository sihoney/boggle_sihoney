package com.javaex.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.ReviewWriteDao;

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
}
