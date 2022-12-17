package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MybookService;
import com.javaex.service.UserService;
import com.javaex.vo.MybookVo;
import com.javaex.vo.PlaylistVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="")
public class MybookController {
   
   //필드
   @Autowired
   private MybookService mybookService;   
   @Autowired
   private UserService userService;
      
   //내서재
   @RequestMapping("/{nickname}")
   public String myreview(@PathVariable(value="nickname") String nickname,
                     					HttpSession session, 
                     					Model model) {
      System.out.println("MybookController > /{nickname}");

      if (session == null 
    		  || session.getAttribute("authUser") == null 
    		  || session.getAttribute("authUser").equals("")) {
		   System.out.println("세션만료 혹은 잘못된 접근");
		   
		   return "user/loginForm";
	   }
      
      //세션의 닉네임
      String yours = ((UserVo)session.getAttribute("authUser")).getNickname();
      System.out.println("로그인사람의 닉네임 : "+yours);
      System.out.println("지금 서재 닉네임 : "+nickname);
            
      //세션아이디랑 지금 블로그닉네임이 같니?
      if(nickname.equals(yours)) { // 내 페이지 방문
         
         String result = "sameUser";
         System.out.println(result);
         
         //result 값 보내주기
         model.addAttribute("result", result);
         
         //세션아이디의 유저넘버
         int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo(); 
         UserVo Userinfo = userService.getUser(yours);
         
         model.addAttribute("Userinfo", Userinfo);

         return "mybook/mybook_review";
         
      } else { // 다른 유저 페이지 방문
   
         String result = nickname;
         System.out.println("anotherUser");
         
         //result 값 보내주기
         model.addAttribute("result", result);
         
         if (userService.getUser(nickname) == null) {
		   System.out.println("잘못된 접근입니다");
		   
		   return "/main/main";
	     }
         
         //지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
         UserVo otherUser = userService.getUser(nickname);
         int userNo = otherUser.getUserNo();
         
         model.addAttribute("Userinfo", otherUser);

         return "mybook/otherbook_review";
      }
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody  //리스폰스바디에 붙여 보낼게!
   @RequestMapping("/{nickname}/list")   
   public Map<String, Object> list(@PathVariable(value="nickname") String nickname,
						           HttpSession session, 
						           Model model,
						           @RequestParam(value="sort", required=false, defaultValue= "latest") String sort,
						           @RequestParam(value="crtPage", required=false, defaultValue= "1") Integer crtPage,
						           @RequestParam(value="emoName", required=false) String emoName,
						           @RequestBody(required=false) MybookVo clicked){
	   System.out.println("MybookController.list()");
	   
	   // 로그아웃 처리하기...
	   UserVo authUser = (UserVo) session.getAttribute("authUser");
	   if(authUser == null) {
		   System.out.println(">>세션 만료");
		   return null;
	   }
	   
	   String yours = ((UserVo)session.getAttribute("authUser")).getNickname(); //세션의 닉네임
	   
	   if(clicked != null && emoName == null) {
		   emoName = clicked.getEmoName(); 
	   }
	   
	   
	   if(nickname.equals(yours)) { // 내 홈페이지 방문
	         //서평리스트출력
	         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
	         System.out.println("내 홈페이지 방문");		   
		   
	         //세션아이디의 유저넘버
	         int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
	         
	         Map<String, Object> mybookMap = mybookService.list(sort, crtPage, userNo, emoName, userNo);

	         return mybookMap;
	   } 
	   else { // 다른 유저 홈페이지 방문
	    	 //로그인한 유저넘버
	    	 int nowuserNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
	                  
	         //지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
	         UserVo otherUser = userService.getUser(nickname);
	         int userNo = otherUser.getUserNo();
	         
	         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
	         System.out.println("유저 " + userNo + "의 홈페이지 방문");
	         
	         Map<String, Object> mybookMap = mybookService.list(sort, crtPage, userNo, emoName, nowuserNo);

	         return mybookMap;
	   }
   }
 
   //감정 카테고리 선택시 기능
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping("/{nickname}/select")
   public Map<String, Object> select(@PathVariable(value="nickname") String nickname,
		   						HttpSession session,
		   						@RequestBody MybookVo clicked,
		   						@RequestParam(value="crtPage", required=false, defaultValue="1")Integer crtPage) {
      
	  //세션의 닉네임
	  String yours = ((UserVo)session.getAttribute("authUser")).getNickname(); 
	   
	  //세션아이디랑 지금 블로그닉네임이 같니?
      if(nickname.equals(yours)) { // 내 홈페이지 방문
         
    	  //세션아이디의 유저넘버, 선택한 감정태그
          int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
          String emoName = clicked.getEmoName();
      
          System.out.println("지금 서재 유저 넘버 : " + userNo);
          System.out.println("선택한 감정태그 : " + emoName);

          Map<String, Object> mybookMap = mybookService.list("emotion", crtPage, userNo, emoName, userNo);

          return mybookMap;      
         
      } else { // 다른 유저 홈페이지 방문
             	  
    	 int nowuserNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
    	  
         //지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
         UserVo otherUser = userService.getUser(nickname);
         int userNo = otherUser.getUserNo();
         String emoName = clicked.getEmoName(); 

         System.out.println("지금 서재 유저 넘버 : " + userNo);
         System.out.println("선택한 감정태그 : " + clicked.getEmoName());

         //유저넘버, 감정태그 주면 해당유저의 서평 중 그 감정태그를 가진것만 출력해주기
         Map<String, Object> mybookMap = mybookService.list("emotion", crtPage, userNo, emoName, nowuserNo);

         return mybookMap; 
      }
   }   
   
   //좋아요버튼을 눌렀을때의 기능
   @ResponseBody
   @RequestMapping("/like")
   public MybookVo like(HttpSession session,
		   		   		@RequestBody MybookVo clickReview) {
      
      //세션아이디의 유저넘버
      int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
      //클릭한 서평 넘버
      int clickNo = clickReview.getReviewNo();
      
      System.out.println("로그인한 유저 넘버 : " + userNo);
      System.out.println("클릭한 서평 넘버 : " + clickNo);
      
      MybookVo checklike = new MybookVo(clickNo, userNo);

      //해당유저가 좋아요를 했는지 안했는지, 좋아요가 몇갠지 불러오기.
      MybookVo likeok = mybookService.likecnt(checklike);
      
      System.out.println("좋아요 갯수 : "+likeok.getLikecnt());
      System.out.println("좋아요 여부 확인 : "+likeok.getLikecheck());
      
      //좋아요를 안한경우
      if(likeok.getLikecheck() == 0) {
         
		 //review_user table에 인서트
    	 mybookService.like(checklike);
	     
	     System.out.println(checklike.getReviewNo()+"번 서평 좋아요");
	     
	     return likeok;
	     
      //좋아요를 이미 한 경우
      }else {
    	  
         //review_user에서 삭제
    	 mybookService.dislike(checklike); 
    	  
    	 System.out.println(checklike.getReviewNo()+"번 서평 좋아요 취소");
    	 
    	 return likeok;
      }
   }
   
   
   //삭제 버튼을 눌렀을때의 기능
   @ResponseBody
   @RequestMapping("/delete")
   public int delete(HttpSession session,
		   		   	 @RequestBody MybookVo clickReview) {
      
      //세션아이디의 유저넘버
      int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
      //클릭한 서평 넘버
      int clickNo = clickReview.getReviewNo();
      
      System.out.println("로그인한 유저 넘버 : " + userNo);
      System.out.println("클릭한 서평 넘버 : " + clickNo);
      
      MybookVo wannadelete = new MybookVo(clickNo, userNo);

      //해당 유저의 서평일 경우에만 삭제가 가능하게 하기
      int checkuser = mybookService.delete(wannadelete);
      
      //값이 1일때는 삭제하려는 리뷰의 작성자와 로그인사용자가 같음을 의미 
      return checkuser;
   }
   
   @ResponseBody
   @RequestMapping("/getplaylist")
   public List<PlaylistVo> getPlaylist(@RequestParam(value="reviewno")int reviewNo,
		   				   HttpSession session) {
	   System.out.println("MybookController.playlist >> reviewNo: " + reviewNo);
   
	   UserVo authUser = (UserVo) session.getAttribute("authUser");
	   int userNo = authUser.getUserNo();
	   
	   return mybookService.getPlaylist(reviewNo, userNo);
   }
  
}