package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MybookVo;
import com.javaex.vo.PlaylistVo;

@Repository
public class MybookDao {
	
	@Autowired
	private SqlSession sqlSession;


//	paging이 적용된 리스트 가져오기
	public List<MybookVo> getList2(int startNum, int endNum, int userNo) {
		
		System.out.println("MybookDao.getList2()");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("mybook.getList2", map);
	}

//	페이징 기능 + 인기순 리스트
	public List<MybookVo> getPopular2(int startNum, int endNum, int userNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userNo", userNo);		
		
		return sqlSession.selectList("mybook.selectpopular2", map);
	}
	
	public int totalCnt(int userNo) {
		return sqlSession.selectOne("mybook.totalCnt", userNo);
	}
	
	public int checklike(MybookVo checklike){
		//System.out.println("MybookDao.checklike()");
		
		List<MybookVo> likecount = sqlSession.selectList("mybook.checklike", checklike);
		int count = likecount.size();
		
		//System.out.println(count+"건 조회됨");
				
		return count;
	}
	
	public MybookVo checklikecnt(MybookVo checklike){
		//System.out.println("MybookDao.checklike()");
		
		//좋아요 몇개인지 담아서 보냄
		MybookVo likecnt = sqlSession.selectOne("mybook.checklikecnt", checklike);
		
		System.out.println("Dao좋아요갯수" +likecnt);
		
		return likecnt;
	}
	
	public void like(MybookVo checklike) {
		System.out.println("MybookDao.like()");
		
		int count = sqlSession.insert("mybook.like", checklike);
		System.out.println(count+"건을 좋아요하였습니다.");
	}
	
	public void dislike(MybookVo checklike) {
		System.out.println("MybookDao.dislike()");
		
		int count = sqlSession.delete("mybook.dislike", checklike);
		System.out.println(count+"건을 좋아요 취소하였습니다.");
	}
	
	//유저넘버 입력시 해당유저가 가장 최근에 좋아요한 서평가져오기
	public List<MybookVo> likereview(int userNo) {
		System.out.println("MybookDao.likereview");
		
		List<MybookVo> likereview = sqlSession.selectList("mybook.like1", userNo);
		
		return likereview;
	}
	
	//유저넘버 입력시 해당유저가 가장 최근에 좋아요한 서평 유저목록
	public List<MybookVo> likelist(int userNo) {
		System.out.println("MybookDao.likelist");
		
		List<MybookVo> likelist = sqlSession.selectList("mybook.likelist", userNo);
		
		return likelist;
	}
	
	//유저넘버 입력시 해당 유저의 총 서평갯수
	public MybookVo reviewcnt(int userNo) {
		System.out.println("MybookDao.reviewcnt");
		
		MybookVo reviewcnt = sqlSession.selectOne("mybook.reviewcnt", userNo);
				
		return reviewcnt;
	}
	
	//리뷰넘버정보를 주면 해당 리뷰를 쓴 유저 정보를 줌
	public MybookVo checkuser(int reviewNo) {
		System.out.println("mybookDao.checkuser()");
		
		MybookVo checkuser = sqlSession.selectOne("mybook.checkuser", reviewNo);
		
		return checkuser;
	}
	
	//리뷰넘버정보를 주면 해당 리뷰 삭제
	public void delete(int reviewNo) {
		System.out.println("mybookDao.delete()");
		
		sqlSession.delete("mybook.delete", reviewNo);
	}
	
	//해당 유저넘버, 감정태그 받으면 그 리스트만 출력
	public List<MybookVo> emoList(int startNum, int endNum, int userNo, String emoName){
		System.out.println("mybookDao.emoList");
		
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userNo", userNo);
		map.put("emoName", emoName);
		
		List<MybookVo> emoList = sqlSession.selectList("mybook.emoList2", map);
		
		return emoList;	
	}
	
	public List<PlaylistVo> getPlaylist(int reviewNo, int userNo) {
		System.out.println("mybookDao.getPlaylist");
		
		Map<String, Integer> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("userNo", userNo);
		
		List<PlaylistVo> pList =  sqlSession.selectList("mybook.getPlaylist", map);
		System.out.println(pList);
		
		return pList;
	}
}
