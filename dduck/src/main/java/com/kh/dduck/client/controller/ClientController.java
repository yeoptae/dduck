package com.kh.dduck.client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.dduck.client.model.service.ClientService;
import com.kh.dduck.client.model.vo.Client;

@SessionAttributes(value = { "loginClient" })
@Controller
public class ClientController {

   private Logger logger = LoggerFactory.getLogger(ClientController.class);

   @Autowired
   ClientService service;

   
   @Autowired
   BCryptPasswordEncoder pwEncoder;
   
   
   
   //로그인 뷰로 갑니다.
   @RequestMapping("/login/loginView.do")
   public String login() {
      return "login/login";
   }
   @RequestMapping("/client/clientLogin.do")

      public String login(Client c, Model model, SessionStatus status) {

         Client result = service.selectClientOne(c);
         String msg = "";
         String loc = "/";

    	  
       if(result!=null &&pwEncoder.matches(c.getCPw(), result.getCPw())){
    		  msg = "로그인 성공";
              model.addAttribute("loginClient", result);
    		  
    	  } else {
        	   msg = "로그인 실패";
         }

         model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);

         return "common/msg";
      }
      
   // 로그아웃
   @RequestMapping("/Client/ClientLogout.do")
   public String logout(HttpSession session, SessionStatus status) {

      if (!status.isComplete()) {
         status.setComplete();
         session.invalidate();

      }
      logger.debug("dggddggd");
      return "login/login";

   }

   /* 회원가입 화면전환 */
   @RequestMapping("/client/clientEnroll.do")
   public String enroll() {
      return "client/clientEnroll";
   }
   
   
   

   /* 회원가입 */
   @RequestMapping("/client/clientEnrollEnd.do")
   public String enrollEnd(Client c, Model model) {
      c.setCPw(pwEncoder.encode(c.getCPw()));
      int result = service.insertClient(c);
      String msg = "";
      String loc = "";
      if (result > 0) {
         msg = "회원가입완료";
      } else {
         msg = "회원가입오류";
      }
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);

      return "common/msg";
   }

   /*정보수정*/
     @RequestMapping("/update/updateEnd.do") 
     public String updateEnd( Client c,Model model) { 
        System.out.println("updateEnd"+c);
        logger.debug("업데이트 됐냐?");
        
        int result = service.updateClient(c);
         
           String msg = "";
         String loc = "";
         if (result > 0) {
            msg = "정보수정완료";
         } else {
            msg = "정보수정오류";
         }
         model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);

         return "common/msg";
      }
     
     
      /* 마이페이지 뷰 전환*/
       @RequestMapping("/mypage/mypage.do") public String modify() { 
    	   
    	   return "login/mypage";
       
       }
      
     
    

   /* 내정보 출력 */

   @RequestMapping("/update/update.do")
   public String clientInfo(HttpServletRequest request, Client c, Model model) {
      String cNo = request.getParameter("cNo");
      System.out.println("!!!!!!!cNo" + cNo);
      Client result = service.selectClient(c, cNo);
//         List<Members> members=service.selectMember(memNo);
      model.addAttribute("client", result);

      return "update/update";
   }
   
   /*회원탈퇴 뷰*/
   @RequestMapping("/withdraw/withdraw.do")
   public String withdraw() {
      return "login/withdraw";
   }
   
   
   
 /*회원탈퇴*/
   @RequestMapping("/withdraw1/withdraw1.do")
	public String deleteReview(Client c, Model model) {
	   c.setCPw(pwEncoder.encode(c.getCPw()));
		int result = service.deleteClient(c);
         System.out.println("!!!!!!!"+c);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "탈퇴 완료";
			loc="/login/login";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "탈퇴 실패";
			loc = "/";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
   
   
   /*마이페이지에서 비밀번호 변경뷰매소드*/
   @RequestMapping("/pwChange/pwChange.do")
   public String pwChange() {
      return "login/pwChange";
   }
   
   /*마이페이지에서 비밀번호 변경매소드*/
   @RequestMapping("/pwChangeEnd/pwChangeEnd.do")
   public String pwChangeEnd(Client c, Model model) {
	   c.setCPw(pwEncoder.encode(c.getCPw()));
       logger.debug("비버변경 됐니??"+c);
       
       int result = service.updatePwChange(c);
        
        String msg = "";
        String loc = "";
        if (result > 0) {
           msg = "비번변경완료";
        } else {
           msg = "취소하셧습니다.";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);

        return "common/msg";
     }
   
   
   
   
   
   
   
   
   /*비번 찾아서 변경하는 매소드*/
   @RequestMapping("/pass_change.do")
   public String pwSearchEnd(HttpServletRequest request,Client c, Model model, String e_mail){
 	  c.setCPw(pwEncoder.encode(c.getCPw()));
       logger.debug("비버변경 됐니??"+c);
       
       int result = service.updatePw(c);
        
        String msg = "";
        String loc = "";
        if (result > 0) {
           msg = "비번변경완료";
        } else {
           msg = "비번변경오류";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);

        return "common/msg";
     }
 	  
   

   
   @RequestMapping("/user/idCheck")
   public @ResponseBody int idCheck(@RequestParam("cId") String cId) {
	   
	   System.out.println(" sssss  ");
	   int result = service.userIdCheck(cId);
	   
		return result;
	}
   
   
   
   
   
   
}
   
               

   
