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

   // 로그인시 널값이 아닐경우 이 맵핑값으로 넘어와 해당 로직 실행
//   @RequestMapping("/client/clientLogin.do")
//   public String login(Client c, Model model, HttpSession session) {
//      
//      Client result = service.selectClientOne(c);
//      System.out.println(result+"이건 잘 되냐");
//      String msg = "";
//      String loc = "/";
//
//      if (c.getCId().equals("admin") && pwEncoder.matches(c.getCPw(), result.getCPw())) {
//
//         msg = "로그인 성공";
//         session.setAttribute("loginClient", result);
//         model.addAttribute("loginClient", result);
//      } else if (pwEncoder.matches(c.getCPw(), result.getCPw())) {
//         msg = "로그인 성공";
//         session.setAttribute("loginClient", result);
//         model.addAttribute("loginClient", result);
//      } else {
//
//         msg = "로그인 실패";
//      }
//
//      model.addAttribute("msg", msg);
//      model.addAttribute("loc", loc);
//
//      return "common/msg";
//   }
   @RequestMapping("/client/clientLogin.do")

      public String login(Client c, Model model, SessionStatus status) {

         Client result = service.selectClientOne(c);
         System.out.println(result + "이건 잘 되냐");
         String msg = "";
         String loc = "/";

      if (c.getCId().equals("admin") && pwEncoder.matches(c.getCPw(), result.getCPw())) {

         
            msg = "로그인 성공";
            model.addAttribute("loginClient", result);
         } else if (pwEncoder.matches(c.getCPw(), result.getCPw())) {
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
            msg = "회원가입완료";
         } else {
            msg = "회원가입오류";
         }
         model.addAttribute("msg", msg);
         model.addAttribute("loc", loc);

         return "common/msg";
      }
     
     /*
      * 마이페이지 뷰 전환
      * 
      * @RequestMapping("/update/update.do") public String modify() { return
      * "update/update";
      * 
      * }
      */
     
    

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
   

}