package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.PlaylistFolderService;
import com.javaex.vo.LikeReviewVo;
import com.javaex.vo.PlaylistFolderVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("/playlist")
public class PlaylistFolderController {
	
	@Autowired
	private PlaylistFolderService playlistfolderService;
	
	/* 플레이리스트 폴더 클릭 -> 해당 플레이리스트 서평 리스트+페이징  */
	@RequestMapping("/folder")
	public String playlistFolder(@RequestParam("playlistNo") int playlistNo,
								 @RequestParam("makerUserNo") int makerUserNo,
								 @RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
								 Model model,
								 HttpSession session) {
		
		System.out.println("Controller.playlistFolder+paging");
		System.out.println("요청 페이지:"+crtPage);
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			return "main/main";
		}
		int authUserNo = authUser.getUserNo();
	
		//플레이리스트 번호 받기
		//해당 폴더 서평리스트 가져오기(5개)
		Map<String, Object> foldermainMap = playlistfolderService.playlistReviewList(playlistNo, makerUserNo, crtPage, authUserNo);

		//데이터 보내기
		model.addAttribute("foldermainMap",foldermainMap);
		
		return "taste/click-playlist";
		
	}
	
	/* 플리 모달 페이징+리스트 */
	@ResponseBody
	@RequestMapping("/modalListPage")
	public Map<String, Object> modalListPage(@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
											 @RequestParam(value = "playlistNo") int playlistNo) {
		
		System.out.println("Controller.modalListPage");
		System.out.println(crtPage + "번 페이지 요청, playlistNo: " + playlistNo);
		
		//해당페이지의 글 리스트 5개
		Map<String, Object> playlistMap = playlistfolderService.modalListPage(crtPage, playlistNo);
		
		return playlistMap;
	}
	
	
	/* 플리 모달 검색창 */
	@ResponseBody
	@RequestMapping("/reviewSearch")
	public Map<String, Object> reviewSearch(@RequestParam(value="SearchTxt") String searchTxt,
											@RequestParam(value="crtPage", required=false, defaultValue="1")int crtPage,
											@RequestParam(value="playlistNo")int playlistNo) {
		
		System.out.println("Controller.reviewSearch");
	
		Map<String, Object> playlistMap = playlistfolderService.getSearchResult(searchTxt, crtPage, playlistNo);
		
		return playlistMap;
	}
	
	/* 플리 모달 추가 선택 등록 */
	@RequestMapping("/addReviews")
	public @ResponseBody int addReviews(@ModelAttribute PlaylistFolderVo playlistFolderVo, 
										@RequestParam("userNo") int userNo,
										@RequestParam (value="reviewChkBoxArr[]") List<Integer> reviewChkBoxArr) {
											
		System.out.println("Controller.addReviews");
		
		System.out.println("--playlistFolderVo: " + playlistFolderVo);
		System.out.println("--userNo: " + userNo);
		System.out.println("--reviewChkBoxArr: " + reviewChkBoxArr);
		/*
		--playlistFolderVo: PlaylistFolderVo [playlistNo=52, playlistName=null, playlistDate=null, reviewNo=0, reviewContent=null, reviewDate=null, nickname=null, userNo=6, bookNo=null, bookTitle=null, styleNo=0, emoName=null, rn=0, likecnt=0]
		--userNo: 6
		--reviewChkBoxArr: [165, 11]		
		*/
		int addResult = playlistfolderService.reviewsInsert(playlistFolderVo, reviewChkBoxArr);
		
		return addResult;
	
	}
	
	/* 서평 삭제 */
	@ResponseBody
	@RequestMapping("/reviewDelete")
	public int reviewRemove(@RequestParam("reviewNo") int reviewNo) {
		
		System.out.println("Controller.reviewDelete");
		System.out.println(reviewNo);
		
		int deleteResult = playlistfolderService.reviewDelete(reviewNo);
		
		return deleteResult;
		
	}
	
	/* 로딩시 플리 좋아요 체크 */
	@ResponseBody
	@RequestMapping("/checkPlyAlreadyLiked")
	public int checkPlyAlreadyLiked(@ModelAttribute PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Controller.checkPlyAlreadyLiked");

		int checkLike = playlistfolderService.checkPlyAlreadyLiked(playlistFolderVo);
		
		return checkLike;
	}
	
	/* 해당 플리 좋아요 취소 */
	@ResponseBody
	@RequestMapping("/playlistUnlike")
	public int playlistUnlike(@ModelAttribute PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Controller.playlistUnlike");
		int unlikeResult = playlistfolderService.playlistUnlike(playlistFolderVo);
		
		return unlikeResult;
	}
	
	/* 해당 플리 좋아요 */
	@ResponseBody
	@RequestMapping("/addplaylistLike")
	public int addplaylistLike(@ModelAttribute PlaylistFolderVo playlistFolderVo) {
		
		System.out.println("Controller.addplaylistLike");
		int likeResult = playlistfolderService.playlistlike(playlistFolderVo);
		
		return likeResult;
	}

//	서평 좋아요 & 좋아요 취소
	@ResponseBody
	@RequestMapping("/toggleLikeReview")
	public int toggleLikeReview(@RequestParam("reviewNo")Integer reviewNo,
								@RequestParam("like")Integer like,
								HttpSession session) {
		
		System.out.println("Controller.toggleLikeReview");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {return -2;} 
		Integer userNo = authUser.getUserNo();
		
		LikeReviewVo reviewVo = new LikeReviewVo();
		reviewVo.setReviewNo(reviewNo);
		reviewVo.setUserNo(userNo);
		
		return playlistfolderService.toggleLikeReview(reviewVo, like);
	}
	
//	플리에서 서평 삭제 
	@ResponseBody
	@RequestMapping("deleteReviewFromPly")
	public int deleteReviewFromPly(@RequestParam("reviewNo")int reviewNo,
								   	  @RequestParam("playlistNo")int playlistNo,
								   	  @RequestParam("makerUserNo")int makerUserNo,
								   	  @RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
								   	  Model model,
									  HttpSession session) {
		System.out.println("Controller.deleteReviewFromPly");

		return playlistfolderService.deleteReview(reviewNo, playlistNo);
	}
}
