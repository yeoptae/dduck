package com.kh.dduck.panier.controller;

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
	
   	//장바구니에서 결제페이지로
   	@RequestMapping("/panier/payment")
   	public ModelAndView paymentAndPayment(int payAmount,String name,int price,
   			int totalPrice,int pCode,int panierCode) {
   		
   		System.out.println("상품명 : "+name);
   		System.out.println("수량 : "+payAmount);
   		System.out.println("상품가격 : "+ price);
   		System.out.println("수량*가격 "+ totalPrice);
   		System.out.println("pCode "+ pCode);
   		System.out.println("panierCode "+ panierCode);
   		
   		ModelAndView mv = new ModelAndView();
   		mv.addObject("payAmount",payAmount);
   		mv.addObject("name",name);
   		mv.addObject("price",price);
   		mv.addObject("totalPrice",totalPrice);
   		mv.addObject("pCode",pCode);
   		mv.addObject("panierCode",panierCode);
   		
   		mv.setViewName("payment/paymentView2");
		
		return mv;
   	}
   	
}
