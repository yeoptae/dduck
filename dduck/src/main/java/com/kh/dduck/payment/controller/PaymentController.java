package com.kh.dduck.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {

	@RequestMapping("/payment/paymentView")
	public String paymentView() {
		
		
		return "payment/paymentView";
	}
	
}
