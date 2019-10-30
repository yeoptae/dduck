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

}
