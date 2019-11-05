package com.kh.dduck.panier.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dduck.panier.model.service.PanierService;
import com.kh.dduck.panier.model.vo.Panier;

@Controller
public class PanierController {

	@Autowired
	PanierService service;

	@RequestMapping("/payment/panier")
	public String panierView(Model model, Panier p) {

		int result = service.insertPanier(p);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "등록 완료";
			loc = "/detail/detailView?pCode="+p.getPCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "등록 실패";
			loc = "/detail/detailView";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
	
   	//장바구니삭제
   	@RequestMapping("/client/panierDelete")
  	public String deleteReview(Panier p, Model model) {
   		
  		int result = service.deletePanier(p);

  		String msg = "";
  		String loc = "";

  		if (result > 0) {
  			msg = "삭제 완료";
  			loc="/client/panier?panierCode="+p.getPanierCode()+"&cId="+p.getCId();
  			model.addAttribute("msg", msg);
  			model.addAttribute("loc", loc);

  		} else {
  			msg = "삭제 실패";
  			loc = "client/panier";
  			model.addAttribute("msg", msg);
  			model.addAttribute("loc", loc);

  		}

  		return "common/msg";
  	}
	
   	
   	// 결제버튼 눌렀을시 페이지이동
   	@RequestMapping("/payment/detailViewGo")
   	public String detailViewGo(int pCode) {
   		
   		System.out.println("이동가즈아~~");
   		return "payment/detailView?pCode="+pCode;
   	}
   	
}
