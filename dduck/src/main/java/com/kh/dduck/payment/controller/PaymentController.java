package com.kh.dduck.payment.controller;

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
	
}
