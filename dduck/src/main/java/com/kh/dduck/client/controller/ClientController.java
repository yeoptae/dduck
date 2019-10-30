package com.kh.dduck.client.controller;

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
	
	private Logger logger=LoggerFactory.getLogger(ClientController.class);
	
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
		

	
	
	//로그아웃
   @RequestMapping("/Client/ClientLogout.do")
   public String logout(HttpSession session, SessionStatus status) {
	   
      
      if(!status.isComplete()) {
         status.setComplete();
         session.invalidate();
         
      }
      logger.debug("dggddggd");
      return "login/login";

   }
   //회원가입페이지
   @RequestMapping("/Client/signUp.do")
   public String signUp() {
	   return "login/signup";
   }
   
   
  //회원가입
   @RequestMapping("/Client/enroll.do")
   public String enroll() {
	   return "/"; 
   }

}
