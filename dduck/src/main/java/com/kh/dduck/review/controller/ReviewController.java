package com.kh.dduck.review.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.common.PageBarFactory;
import com.kh.dduck.review.model.vo.Review;
import com.kh.dduck.review.service.ReviewService;


@Controller
public class ReviewController {

	@Autowired
	ReviewService service;

	// 메인화면 리뷰뿌리기
	@RequestMapping("/detail/detailView")
	public ModelAndView ReviewView(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage, int pCode) {

		
		ModelAndView mv = new ModelAndView();
        
		
		Map<String, Object> saleList = service.selectSale(pCode);
		List<Map<String,Object>> paymentList=service.selectPayment(pCode);
		List<SaleBoardFile> att = service.selectAttachList(pCode);
		System.out.println("!!!!!!!!!!!!!!!!!"+pCode+"!!!!!!!!!!!!!!!!!");
		int numPerPage = 5;
		List<Map<String, String>> list = service.selectReviewList(cPage, numPerPage,pCode);
		
		int totalCount = service.selectReviewCount(pCode);
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/dduck/detail/detailView"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.addObject("saleList", saleList);
		mv.addObject("att", att);
		mv.addObject("paymentList",paymentList);
		mv.setViewName("payment/detailView");

		return mv;

	}

	
	//결제뷰 넘겨주기
	@RequestMapping("/dduck/payment")
	public ModelAndView paymentView(String name, int panierAmount, Date date, int totalprice, String ship, String productPrice, int pCode) {
		System.out.println("떡이름 : " + name);
		System.out.println("수량 : " + panierAmount);
		System.out.println("배송일 : " + date);
		System.out.println("총금액 : " + totalprice);
		System.out.println("배송비용 : " + ship);
		System.out.println("상품금액 : "+ productPrice);
		System.out.println("pCode : " + pCode);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name",name);
		mv.addObject("panierAmount",panierAmount);
		mv.addObject("date",date);
		mv.addObject("totalprice",totalprice);
		mv.addObject("ship",ship);
		mv.addObject("productPrice",productPrice);
		mv.addObject("pCode",pCode);
		
		mv.setViewName("payment/paymentView");
		
		return mv;
	}
	
	
	
	
	// 등록
	@RequestMapping("/review/reviewForm")
	public String insertReview(Review r, Model model) {

		int result = service.insertReview(r);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "등록 완료";
			loc = "/detail/detailView?pCode="+r.getPCode();
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

	// 삭제
	@RequestMapping("/review/reviewDelete")
	public String deleteReview(Review r, Model model) {

		int result = service.deleteReview(r);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "삭제 완료";
			loc="/detail/detailView?pCode="+r.getPCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "삭제 실패";
			loc = "/detail/detailView";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}

	//수정
	@RequestMapping("/review/reviewUpdate")
	public String deleteUpdate(Review r, Model model) {
		
		System.out.println(r);
		int result = service.updateReview(r);
		
		String msg ="";
		String loc ="";
		
		if(result>0) {
			msg = "수정 완료";
			loc="/detail/detailView?pCode="+r.getPCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);

		}else {
			msg = "수정 실패";
			loc="/detail/detailView";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		

		return "common/msg";
	}

}
