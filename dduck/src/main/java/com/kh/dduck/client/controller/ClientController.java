package com.kh.dduck.client.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.client.model.service.ClientService;
import com.kh.dduck.client.model.vo.Client;
import com.kh.dduck.common.PageBarFactory;

@SessionAttributes(value = { "loginClient" })
@Controller
public class ClientController {

	private Logger logger = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	ClientService service;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	// 로그인 뷰로 갑니다.
	@RequestMapping("/login/loginView.do")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/client/clientLogin.do")
	public String memberLogin(Client c, Model model, SessionStatus session, HttpServletRequest request,
			SessionStatus status) {

		Client result = service.selectClientOne(c);
		String msg = "";
		String loc = "/";
		if (result == null) {
			msg = "존재하지 않는 아이디입니다.";
		} else if (pwEncoder.matches(c.getCPw().trim(), result.getCPw().trim())) {
			msg = "로그인 성공";
			model.addAttribute("loginClient", result);
//              session.setAttribute("loginMember", result);

		} else {
			msg = "비밀번호가 틀립니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";

	}

	// 로그아웃
	@RequestMapping("/Client/ClientLogout.do")
	public String logout(HttpSession session, SessionStatus sessions) {

		if (!sessions.isComplete()) {
			sessions.setComplete();
			System.out.println(session + "        111111111111111");

		}
		logger.debug("dggddggd");
		return "redirect:/";

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

	/* 정보수정 */
	@RequestMapping("/update/updateEnd.do")
	public String updateEnd(Client c, Model model) {
		System.out.println("updateEnd" + c);

		int result = service.updateClient(c);

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "정보수정완료";
//            status.setComplete();
			logger.debug("업데이트 됐냐?" + result);
		} else {
			msg = "정보수정오류";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	/* 마이페이지 뷰 전환 */
	@RequestMapping("/mypage/mypage.do")
	public String modify() {

		return "login/mypage";

	}

	/* 내정보 출력 */

	@RequestMapping("/update/update.do")
	public String clientInfo(Client c) {
		Client result = service.selectClientOne(c);
		return "update/update";
	}

	/* 회원탈퇴 뷰 */
	@RequestMapping("/withdraw/withdraw.do")
	public String withdraw() {
		return "login/withdraw";
	}

	/* 회원탈퇴 */
	@RequestMapping("/withdraw1/withdraw1.do")
	public String deleteReview(Client c, Model model) {
		c.setCPw(pwEncoder.encode(c.getCPw()));
		int result = service.deleteClient(c);
		System.out.println("!!!!!!!" + c);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "탈퇴 완료";
			loc = "/login/login";
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

	/* 마이페이지에서 비밀번호 변경뷰매소드 */
	@RequestMapping("/pwChange/pwChange.do")
	public String pwChange() {
		return "login/pwChange";
	}

	/* 마이페이지에서 비밀번호 변경매소드 */
	@RequestMapping("/pwChangeEnd/pwChangeEnd.do")
	public String pwChangeEnd(Client c, Model model) {
		
		c.setCPw(pwEncoder.encode(c.getCPw().trim()));
		
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

	/* 비번 찾아서 변경하는 매소드 */
	@RequestMapping("/pass_change.do")
	public String pwSearchEnd(HttpServletRequest request, Client c, Model model, String e_mail) {
		
		c.setCPw(pwEncoder.encode(c.getCPw().trim()));
		logger.debug("비버변경 됐니??" + c);

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
	
	/*회원가입시 아이디 중복체크*/
	@RequestMapping("/user/idCheck")
	public @ResponseBody int idCheck(@RequestParam("cId") String cId) {

		System.out.println(" sssss  ");
		int result = service.userIdCheck(cId);

		return result;
	}
	
	/*회원가입시 이메일 중복체크*/
	@RequestMapping("/user/mailCheck")
	public @ResponseBody int mailCheck(@RequestParam("e_mail") String cEmail) {

		System.out.println(" 메일메일메일메일메일 ");
		int result = service.userMailCheck(cEmail);

		return result;
	}

	// 장바구니
	@RequestMapping("/client/panier")
	public ModelAndView panier(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			String cId) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 10;
		List<Map<String, String>> list = service.selectPanierList(cPage, numPerPage, cId);
		int totalCount = service.selectPanierCount();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/spring/client/panier"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("client/panier");

		return mv;

	}

	// 결제내역 출력
	@RequestMapping("/client/paymentList")
	public ModelAndView paymentList(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			String cId) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 10;

		List<Map<String, String>> list = service.selectPaymentEndList(cPage, numPerPage, cId);
		int totalCount = service.selectPaymentEndCount();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/spring/client/paymentList"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);

		mv.setViewName("client/paymentList");

		return mv;
	}

}
