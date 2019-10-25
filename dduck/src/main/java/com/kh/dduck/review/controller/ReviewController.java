package com.kh.dduck.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.common.PageBarFactory;
import com.kh.dduck.review.model.vo.Review;
import com.kh.dduck.review.service.ReviewService;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;

	// 메인화면 리뷰뿌리기
	@RequestMapping("/detail/detailView")
	public ModelAndView ReviewView(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 5;
		List<Map<String, String>> list = service.selectReviewList(cPage, numPerPage);
		int totalCount = service.selectReviewCount();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/dduck/detail/detailView"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("payment/detailView");

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
			loc = "/detail/detailView";
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
			loc = "/detail/detailView";
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


	@RequestMapping("/review/reviewUpdate")
	public String deleteUpdate(Review r, Model model) {
		
		System.out.println(r);
		int result = service.updateReview(r);
		
		String msg ="";
		String loc ="";
		
		if(result>0) {
			msg = "수정 완료";
			loc="/detail/detailView";
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
