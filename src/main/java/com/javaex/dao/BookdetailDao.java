package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BookdetailVo;
import com.javaex.vo.ReviewVo;

@Repository
public class BookdetailDao {
	
	
	@Autowired
	private SqlSession sqlSession;
	

	/* 해당 책 리뷰 리스트 가져오기 */
	public List<ReviewVo> getReviewList(String bookNo) {

		System.out.println("Dao.getReviewList");
		List<ReviewVo> reviewList = sqlSession.selectList("bookdetail.reviewListLatest",bookNo);
		System.out.println(reviewList);

		return reviewList;

	}
	
	
	/* 해당 책 정보 */
	public BookdetailVo getBookVo(String bookNo) {

		System.out.println("Dao.getBookVo");
		BookdetailVo bookVo = sqlSession.selectOne("bookdetail.getbookVo",bookNo);
		System.out.println("dao: "+bookVo);

		return bookVo;

	}
	
	/* 해당 책 총 서평 수 */ 
	public int getCount(String bookNo) {

		System.out.println("Dao.getCount");
		int getCount = sqlSession.selectOne("bookdetail.bookReviewCount",bookNo);
		System.out.println(getCount);

		return getCount;

	}

}
