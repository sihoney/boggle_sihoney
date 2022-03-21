package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BookmarkVo;

@Repository
public class BookmarkDao {
	
	@Autowired
	private SqlSession sqlSession;

	/*북마크 리스트 */
	public List<BookmarkVo> getBMList(int userNo){
		System.out.println("BookmarkDao.getBookMarkList()");
		
		List<BookmarkVo>bookmarkList = sqlSession.selectList("bookmark.bookMarkList", userNo);
			System.out.println(bookmarkList);
		
		return bookmarkList;
	}
	
	/*책 수 가져오기*/
//	public int countotal() {
//		System.out.println("Dao.countTotal");
//		int countTtl = sqlSession.selectOne("bookmark.countTotal");
//		return countTtl;
//	}
}
//	
//	public BookmarkVo getBmList(int bookNo, int userNo) {
//		
//		Map<String, Integer> bmlist = new HashMap<String, Integer>();
//		bmlist.put("bookNo", userNo);
//		bmlist.put("userNo", userNo);
//		
//		BookmarkVo bmList = sqlSession.selectOne("bookmark.bookMarkList", bmlist);
//		
//		return bmList;
//	}
//}

