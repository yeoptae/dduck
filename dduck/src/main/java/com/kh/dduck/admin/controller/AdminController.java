package com.kh.dduck.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.adminboard.model.service.AdminBoardService;
import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.common.PageBarFactory;

@Controller
public class AdminController {

	@Autowired
	AdminBoardService service;


	
	/* saleboard search & List(상품 리스트 검색추가) */
	@RequestMapping("/admin/saleboardList.do")
	public ModelAndView saleboardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "") String searchWord, HttpServletRequest request,
			int gCode) {
		
		System.out.println("searchWord값 : "+searchWord+"1");
		ModelAndView mv = new ModelAndView();

		int numPerPage = 9;
		
		List<Map<String, String>> list = service.selectBoardList(cPage, numPerPage, searchWord, gCode);
		List<Map<String, String>> fileList = service.selectFile();
		int totlaCount = service.selectBoardCount();
		int totlaCount2 = service.selectBoardCount2(searchWord);
		
		mv.addObject("searchWord",searchWord);
		mv.addObject("count", totlaCount);
		mv.addObject("list", list);
		mv.addObject("fileList", fileList);
		mv.addObject("gCode", gCode);
		mv.addObject("pageBar",
				PageBarFactory.getPageBarWhere2(totlaCount2, cPage, numPerPage, "/dduck/admin/saleboardList.do", gCode,searchWord));

		mv.setViewName("saleboard/saleboardList");

		return mv;
	}

	@RequestMapping("/admin/boardUpdate.do")
	public ModelAndView updateProduct(HttpServletRequest request, int pCode) {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> saleList = service.selectSaleBoard(pCode);
		List<SaleBoardFile> att = service.selectSaleBoardFile(pCode);
		mv.addObject("saleList", saleList);
		mv.addObject("att", att);
		mv.setViewName("saleboard/saleBoardUpdate");
		return mv;
	}

	@RequestMapping("/admin/saleBoardUpdateEnd.do")
	public ModelAndView updateProductEnd(@RequestParam Map<String, Object> param,
			@RequestParam(value = "dduckpic", required = false) MultipartFile[] dduckpic, HttpServletRequest request,int pCode) {
			
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/board");
		List<SaleBoardFile> boardFile = new ArrayList();
         
		
		
		/*
		 * File dir = new File("C:/123.txt"); if( file.exists() ){ if(file.delete()){
		 * System.out.println("파일삭제 성공"); }else{ System.out.println("파일삭제 실패"); } }else
		 * { System.out.println("파일이 존재하지 않습니다."); } }
		 */
		 
		
		/* 1. resource에 있는 이미지 파일 지운다 2. 디비에 저장된 이미지 삭제 3.이미지 서버와 디비에 저장 4.세일보드 업데이트 */
		/* 예외처리 */
	 
		
	    		
	    	

	File dir = new File(saveDir);
		
	for(MultipartFile f:dduckpic)
	{
		if (!f.isEmpty()) {
				
			String attachReFileName = f.getOriginalFilename();
			String ext = attachReFileName.substring(attachReFileName.lastIndexOf("."));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
			int rdv = (int) (Math.random() * 1000);

				String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext  ;

			try {
				f.transferTo(new File(saveDir + "/" + reName));
			} catch (Exception e) {// IlligalStateException|IOException
				e.printStackTrace();
			}

			SaleBoardFile sale = new SaleBoardFile();
			/* sale.setAttachCode(Integer.parseInt((String)param.get("attachCode"))); */
			sale.setPCode(Integer.parseInt((String) param.get("pCode")));
			sale.setAttachReFileName(reName);
			boardFile.add(sale);
		}
		
	}
	String msg = "";
	String loc = "/detail/detailView?pCode="+pCode;
	String msg2 = "";
	String loc2 = "/detail/detailView?pCode="+pCode;
	
	if(boardFile.size()>0) {
    int att = service.deleteBoardFile(pCode);
	boardFile.get(0).setAttachFlag(1);
	
	int result = 0;
	try {
		result = service.updateBoard(param, boardFile);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if (result > 0) {
		msg = "수정성공";
	} else {
		msg = "수정실패";
	}
}
	else  {  
		if (boardFile.size()>0) {
			msg = "수정성공";
		} else {
			msg = "파일을 넣어주세요";
		}
	}
	ModelAndView mv = new ModelAndView();

	mv.addObject("msg", msg);
	mv.addObject("loc", loc);
	mv.addObject("msg2", msg2);
	mv.addObject("loc", loc2);

	mv.setViewName("common/msg");
	return mv;
	}

	@RequestMapping("/admin/boardDelete.do") 
	 public String deleteSaleBoard(SaleBoard s, Model model) {

			int result = service.deleteSaleBoard(s);
			String msg = "";
			String loc = "";

			if ( result > 0 ) {
				msg = "삭제 완료";
				loc="/";
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

	
	
	@RequestMapping("/admin/mainpage.do")
	public String mainPage() {
		return "admin/main";
	}

	@RequestMapping("/admin/adminClientList.do")
	public ModelAndView adminClietList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
	
		
		int numPerPage = 7;
		List<Map<String, String>> clientList = service.selectClientList(cPage, numPerPage,keyword);
		List<Map<String, String>> clientList2 = service.selectClientList2(cPage, numPerPage);
		int totlaCount = service.selectClientCount();
		int totalCount2 = service.selectClientCount2(keyword);
		mv.addObject("pageBar",
				PageBarFactory.getPageBarWhere2(totalCount2, cPage, numPerPage, "/dduck/admin/adminClientList.do",keyword));
		mv.addObject("pageBar",
				PageBarFactory.getPageBar(totlaCount, cPage, numPerPage, "/dduck/admin/adminClientList.do"));
		mv.addObject("count", totlaCount);
		mv.addObject("count", totalCount2);
		mv.addObject("clientList", clientList);
		mv.addObject("clientList2", clientList2);
		mv.addObject("keyword",keyword);
		mv.setViewName("admin/clientList");
		return mv;
	}

	@RequestMapping("/admin/adminQnaBoard.do")
	public ModelAndView adminQnaBoard(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		List<Map<String, String>> QnaList = service.selectQnaBoard(cPage, numPerPage);
		int totlaCount = service.selectQnaCount();
		mv.addObject("pageBar",
				PageBarFactory.getPageBar(totlaCount, cPage, numPerPage, "/dduck/admin/adminQnaBoard.do"));
		mv.addObject("count", totlaCount);
		mv.addObject("QnaList", QnaList);
		mv.setViewName("admin/adminQnaBoard");
		return mv;
	}

	@RequestMapping("/admin/insertproduct.do")
	public String insertBoard() {
		return "admin/insertBoard";
	}

	@RequestMapping("/admin/insertProductEnd.do")
	public ModelAndView insertBoardEnd(@RequestParam Map<String, String> param,
			@RequestParam(value = "dduckpic", required = false) MultipartFile[] dduckpic, HttpServletRequest request) {

		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/board");
		List<SaleBoardFile> boardFile = new ArrayList();

		File dir = new File(saveDir);
		for (MultipartFile f : dduckpic) {

			if (!f.isEmpty()) {

				String attachReFileName = f.getOriginalFilename();
				String ext = attachReFileName.substring(attachReFileName.lastIndexOf("."));

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv = (int) (Math.random() * 1000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;

				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (Exception e) {// IlligalStateException|IOException
					e.printStackTrace();
				}

				SaleBoardFile sale = new SaleBoardFile();
				sale.setAttachReFileName(reName);
				boardFile.add(sale);
			}

		}
		String msg = "";
		String loc = "/admin/adminmypage.do";
		String msg2 = "";
		String loc2 = "/admin/adminmypage.do";
		
		if(boardFile.size()>0) {
		boardFile.get(0).setAttachFlag(1);
		
		int result = 0;
		try {
			result = service.insertBoard(param, boardFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			msg = "입력성공";
		} else {
			msg = "입력실패";
		}
	}
		else {  
			if (boardFile.size()>0) {
				msg = "입력성공";
			} else {
				msg2 = "파일을 넣어주세요";
			}
		}
		ModelAndView mv = new ModelAndView();

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("msg2", msg2);
		mv.addObject("loc", loc2);

		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/admin/adminmypage.do")
	public ModelAndView paymentList(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 10;

		List<Map<String, String>> list = service.selectPaymentList(cPage, numPerPage);
		int totalCount = service.selectPaymentCount();

		mv.addObject("pageBar",
				PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/dduck/admin/adminmypage.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("admin/adminOrder");

		return mv;
	}
}
