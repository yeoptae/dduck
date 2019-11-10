package com.kh.dduck.panier.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
  	public String deleteReview(Panier p, Model model, String cId) {
   		
  		int result = service.deletePanier(p);
  		String msg = "";
  		String loc = "";
  		System.out.println(cId);
  		if (result > 0) {
  			msg = "삭제 완료";
  			loc="/client/panier?cId="+cId;
  			model.addAttribute("msg", msg);
  			model.addAttribute("loc", loc);

  		} else {
  			msg = "삭제 실패";
  			loc = "/client/panier";
  			model.addAttribute("msg", msg);
  			model.addAttribute("loc", loc);

  		}

  		return "common/msg";
  	}
	
   	//장바구니에서 결제페이지로
   	@RequestMapping("/panier/payment")
   	public ModelAndView paymentAndPayment(int panierCode) {

   		ModelAndView mv = new ModelAndView();
   		
   		int totalcount = service.selectPanierCount(panierCode);
   		List<Map<String,String>> list = service.selectPanierList(panierCode);
   		
   		mv.addObject("totalcount" , totalcount);
   		mv.addObject("list" , list);
   		
   		mv.setViewName("payment/paymentView2");
		
		return mv;
   	}
   	
}
