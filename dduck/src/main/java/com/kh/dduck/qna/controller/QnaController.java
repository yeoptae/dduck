package com.kh.dduck.qna.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.common.PageBarFactory;
import com.kh.dduck.qna.model.service.QnaService;
import com.kh.dduck.qna.model.vo.Qna;
import com.kh.dduck.qna.model.vo.QnaComment;

@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	/* Qna List연결 */
	@RequestMapping("/qna/qnaList.do")
	public ModelAndView QnaList(@RequestParam(value="cPage", 
	required=false, defaultValue="0") int cPage) {
		//반환될 modelandview객체를 생성
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=8;
		
		List<Map<String,String>> list=service.selectQnaList(cPage,numPerPage);
		int totalCount=service.selectQnaCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage,"/19AM_dduck_final/qna/qnaList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("notice/qnaList");
		
		return mv;
	}
	
	/* 마이페이지 Qna List연결 */
	@RequestMapping("/client/ClientQnaList.do")
	public ModelAndView MypageQnaList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		//반환될 modelandview객체를 생성
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=5;
		
		List<Map<String,String>> list=service.selectQnaList(cPage,numPerPage);
		int totalCount=service.selectQnaCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/19AM_dduck_final/client/ClientQnaList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("notice/MypageQnaList");
		
		return mv;
	}
	
	/* Qna View연결 */
	@RequestMapping("/qna/qnaView.do")
	public ModelAndView noticeView(int qaCode) {
		ModelAndView mv=new ModelAndView();
		Map<String, String> qna=service.selectQna(qaCode);
		Map<String, String> qnaComment=service.selectQnaComment(qaCode);
		
		mv.addObject("qna", qna);
		mv.addObject("qnaC",qnaComment);
		mv.setViewName("notice/qnaView");
		return mv;
	}
	
	/* qna comment 등록 */
	@RequestMapping("/qna/qnaCommentSubmit.do")
	public String insertQnaComment(QnaComment q, Model model) {
		int result = service.insertQnaComment(q);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "댓글 등록 완료";
			loc = "/qna/qnaView.do?qaCode="+q.getQaCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "댓글 등록 실패";
			loc = "/qna/qnaView.do?qaCode="+q.getQaCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
	
	/* qna comment 삭제 */
	@RequestMapping("/qna/qnaCommentDelete.do")
	public String qnaCommentDelete(QnaComment qm, Model model) {
		int result=service.qnaCommentDelete(qm);
		
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			msg = "삭제 완료";
			loc = "/qna/qnaView.do?qaCode="+qm.getQaCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "삭제 실패";
			loc = "/qna/qnaView.do?qaCode="+qm.getQaCode();
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
	
	/* qna comment update(수정) */
	@RequestMapping("/qna/qnaCommentUpdate.do")
	public String qnaCommentUpdate(QnaComment qm, Model model) {
		
		int result = service.qnaCommentUpdate(qm);
		
		String msg ="";
		String loc ="";
		
		if(result>0) {
			msg = "수정 완료";
			loc="/qna/qnaView.do?qaCode="+qm.getQaCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);

		}else {
			msg = "수정 실패";
			loc="/qna/qnaView.do?qaCode="+qm.getQaCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		

		return "common/msg";
	}
	
	/* qna 글쓰기 연결 */
	@RequestMapping("qna/qnaForm")
	public String qnaForm() {
		return "notice/qnaForm";
	}

	/* qna 등록 */
	@RequestMapping("/qna/qnaFormEnd.do")
	public String insertQna(Qna qna, Model model) {
		int result=service.insertQna(qna);

		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "등록 완료";
			loc = "/qna/qnaList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "등록 실패";
			loc = "/qna/qnaList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
	
	/* qna 수정페이지로 전환 */
	@RequestMapping("/qna/qnaUpdate.do")
	public ModelAndView qnaUpdate(int qaCode) {
		ModelAndView mv=new ModelAndView();
		Map<String, String> qna=service.selectQna(qaCode);
		
		mv.addObject("qna", qna);
		mv.setViewName("notice/qnaUpdateForm");
		return mv;
	}
	/* qna update end */
	@RequestMapping("/qna/qnaUpdateFormEnd.do")
	public String qnaUpdateFormEnd(Qna qna, Model model) {
		
		int result = service.qnaUpdateFormEnd(qna);
		
		String msg ="";
		String loc ="";
		
		if(result>0) {
			msg = "수정 완료";
			loc="/qna/qnaView.do?qaCode="+qna.getQaCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);

		}else {
			msg = "수정 실패";
			loc="/qna/qnaView.do?qaCode="+qna.getQaCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		

		return "common/msg";
	}
	
	/* qna delete */
	@RequestMapping("qna/qnaDelete.do")
	public String qnaDelete(Qna qna, Model model) {
		int result=service.qnaDelete(qna);
		
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			msg = "삭제 완료";
			loc = "/qna/qnaList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		} else {
			msg = "삭제 실패";
			loc = "/qna/qnaList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

		}

		return "common/msg";
	}
}
