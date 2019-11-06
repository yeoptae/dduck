package com.kh.dduck.payment.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dduck.payment.model.service.PaymentService;
import com.kh.dduck.payment.model.vo.Payment;

@Controller
public class PaymentController {

	@Autowired
	PaymentService service;
	
	@RequestMapping("/payment")
	public String insertPayment(Payment p, Model model) {
		
		int result = service.insertPayment(p);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "결제 완료 마이페이지 결제내역을 확인해주세요.";
			loc = "/";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "결제 실패 관리자에게 문의하세요.";
			loc = "/detail/detailView?pCode="+p.getPCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";	
	}
	@RequestMapping("/payment/dComplete.do")
//	public String updatePayment(Payment p,Model model) {
	public void updatePayment(Payment p, HttpServletResponse res) throws IOException{
		
		int result = service.upDatePayment(p);

		if(result > 0) res.getWriter().print(true);
		else res.getWriter().print(false);
		
//		String msg = "";
//		String loc = "";
//
//		if (result > 0) {
//			msg = "배송완료~~~.";
//			loc = "/admin/adminmypage.do";
//			model.addAttribute("msg", msg);
//			model.addAttribute("loc", loc);
//			model.addAttribute("tr", true);
//
//		} else {
//			msg = "배송관리 실패 관리자에게 문의하세요.";
//			loc = "/admin/adminmypage.do";
//			model.addAttribute("msg", msg);
//			model.addAttribute("loc", loc);
//			model.addAttribute("tr", false);
//		}
//		return "common/msg";	
	}
}
