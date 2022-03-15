package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MybookService;
import com.javaex.service.UserService;
import com.javaex.vo.MybookVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="")
public class MybookController {
   
   
   //필드
   @Autowired
   private MybookService mybookService;   
   @Autowired
   private UserService userService;
   
   
   //서재(서평페이지)
   @RequestMapping("/{nickname}")
   public String myreview(@PathVariable(value="nickname") String nickname,
                     HttpSession session, Model model) {
      System.out.println("mybook");
      
      //세션의 닉네임
      String yours = ((UserVo)session.getAttribute("authUser")).getNickname();
      System.out.println("로그인사람의 닉네임 : "+yours);
      System.out.println("지금 서재 닉네임 : "+nickname);
            
      //세션아이디랑 지금 블로그닉네임이 같니?
      if(nickname.equals(yours)) {
         
         String result = "sameUser";
         System.out.println(result);
         
         //result 값 보내주기
         model.addAttribute("result", result);
         
         //세션아이디의 유저넘버
         int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo(); 
         
         
         //서평리스트출력
         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
         System.out.println("유저넘버"+userNo+"의 리스트");
         
         List<MybookVo> mbList =  mybookService.list(userNo);
         
         //모델로 보내기
         model.addAttribute("mbList", mbList);         
         
         
         return "mybook/mybook_review";
         
      }else {
         
         String result = nickname;
         System.out.println("anotherUser");
         
         //result 값 보내주기
         model.addAttribute("result", result);
         
         
         //지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
         UserVo otherUser = userService.getUser(nickname);
         int userNo = otherUser.getUserNo();
         
         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
         System.out.println("유저넘버"+userNo+"의 리스트");
         
         List<MybookVo> mbList =  mybookService.list(userNo);
         
         //모델로 보내기
         model.addAttribute("mbList", mbList);
         
         
         return "mybook/mybook_review";
      }
      
   }
   
   /*
   //리스트 출력 기능
   @ResponseBody  //리스폰스바디에 붙여 보낼게!
   @RequestMapping("/{nickname}/list")
   public List<MybookVo> list(@PathVariable(value="nickname") String nickname,
                           HttpSession session, Model model) {
      System.out.println("mybook.list");
      
      //세션의 닉네임
      String yours = ((UserVo)session.getAttribute("authUser")).getNickname();
            
      //세션아이디랑 지금 블로그닉네임이 같니?
      if(nickname.equals(yours)) {
         
         //세션아이디의 유저넘버
         int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();

         //서평리스트출력
         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
         System.out.println("유저넘버"+userNo+"의 리스트");
         
         List<MybookVo> mbList = mybookService.list(userNo);
      
         return mbList;
         
      }else {
                  
         //지금 서재 닉네임을 주면 유저넘버, 닉네임, 프로필이미지를 주는 메소드 사용
         UserVo otherUser = userService.getUser(nickname);
         int userNo = otherUser.getUserNo();
         
         //유저넘버를 주면 해당 유저가 작성한 리뷰를 불러오는 메소드
         System.out.println("유저넘버"+userNo+"의 리스트");
         
         List<MybookVo> mbList = mybookService.list(userNo);
         
         return mbList;
      }
      
   }
   */
   
   //좋아요버튼을 눌렀을때의 기능
   @ResponseBody
   @RequestMapping("/like")
   public String like(HttpSession session,
                  @ModelAttribute MybookVo clickReview) {
      
      //세션아이디의 유저넘버
      int userNo = ((UserVo)session.getAttribute("authUser")).getUserNo();
      //클릭한 서평 넘버
      int clickNo = clickReview.getReviewNo();
      
      System.out.println("로그인한 유저 넘버 : " + userNo);
      System.out.println("클릭한 서평 넘버 : " + clickNo);

      //일단 중복이 있는지 부터 확인하자, 해당유저가 이 서평을 좋아요했는지 안했는지 알아보기
//         int likeok = mybookService.likeok(userNo);
//      if(//좋아요테이블에 해당서평과 유저넘버가 이미 존재하는경우가 아닐때 ok) {
//         //세션아이디의 유저넘버 넣어주면 좋아요 반영해주고 좋아요 수도 되돌려주는 메소드
//         MybookVo likeVo = mybookService.like(userNo);
//      }else {
//         //좋아요를 아직 안한경우
      
      
      //유저넘버가져오기
      
      return "";
   }

   //취향저격(main페이지)
   @RequestMapping("/{nickname}/tastemain")
   public String tastemain(@PathVariable(value="nickname") String nickname,
                     HttpSession session, Model model) {
      
         
      return "taste/taste-main";      
   }
   
   
   
}