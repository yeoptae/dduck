package com.kh.dduck.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/admin/saleboardList.do")
	public ModelAndView saleboardList(@RequestParam(value="cPage",
	required=false, defaultValue="1") int cPage, int gCode) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=9;
		List<Map<String,String>> list=service.selectBoardList(cPage,numPerPage,gCode);
		List<Map<String,String>> fileList=service.selectFile();
		System.out.println(fileList);
		System.out.println(list);
		int totlaCount=service.selectBoardCount();
		mv.addObject("pageBar",PageBarFactory.getPageBarWhere(totlaCount, cPage, numPerPage,"/dduck/admin/saleboardList.do",gCode));
		mv.addObject("count",totlaCount);
		mv.addObject("list",list);
		mv.addObject("fileList",fileList);
		mv.addObject("gCode",gCode);
		
		mv.setViewName("saleboard/saleboardList");
		
		return mv;
	}
	
	@RequestMapping("/admin/mainpage.do")
	public String mainPage() {
		return "admin/main";
	}
//	@RequestMapping("/admin/adminmypage.do")
//	public String adminOrder() {
//		return "admin/adminOrder";
//	}
	
	@RequestMapping("/admin/adminClientList.do")
	public  ModelAndView adminClietList(@RequestParam(value="cPage",
		required=false, defaultValue="1") int cPage,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=5;
		List<Map<String,String>> clientList=service.selectClientList(cPage,numPerPage);
		int totlaCount=service.selectClientCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totlaCount, cPage, numPerPage,"/dduck/admin/adminClientList.do"));
		mv.addObject("count",totlaCount);
		mv.addObject("clientList",clientList);
		mv.setViewName("admin/clientList");
		return mv;
	}
	
	
	@RequestMapping("/admin/adminQnaBoard.do")
     public ModelAndView adminQnaBoard(@RequestParam(value="cPage",
    			required=false, defaultValue="1") int cPage,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=5;
		List<Map<String,String>> QnaList=service.selectQnaBoard(cPage,numPerPage);
		int totlaCount=service.selectQnaCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totlaCount, cPage, numPerPage,"/dduck/admin/adminQnaBoard.do"));
		mv.addObject("count",totlaCount);
		mv.addObject("QnaList",QnaList);
		mv.setViewName("admin/adminQnaBoard");
		return mv;
	}
	
	@RequestMapping("/admin/insertproduct.do")
	public String insertBoard() {
		return "admin/insertBoard";
	}
	
	@RequestMapping("/admin/insertProductEnd.do")
	public ModelAndView insertBoardEnd(@RequestParam Map<String,String> param,
		@RequestParam(value="dduckpic",required=false) MultipartFile[] dduckpic
		,HttpServletRequest request) {
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/board");
		List<SaleBoardFile> boardFile=new ArrayList();
		
		File dir=new File(saveDir);
		for(MultipartFile f : dduckpic) {
			
			if(!f.isEmpty()) {
			   
				String attachReFileName=f.getOriginalFilename();
				String ext=attachReFileName.substring(attachReFileName.lastIndexOf("."));
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {//IlligalStateException|IOException
					e.printStackTrace();
				}
				
				SaleBoardFile sale=new SaleBoardFile();
				sale.setAttachReFileName(reName);
				boardFile.add(sale);
				}
			
			}
		boardFile.get(0).setAttachFlag(1);
		int result=0;
		try {
			result=service.insertBoard(param,boardFile);
		}catch(Exception e) {
			e.printStackTrace();
		}
	String msg="";
	String loc="/admin/adminmypage.do";
	if(result>0) {
		msg="입력성공";
	}else {
		msg="입력실패";
	}
    ModelAndView mv=new ModelAndView();
    
    mv.addObject("msg",msg);
    mv.addObject("loc",loc);
	
    mv.setViewName("common/msg");
    return mv;
	}
	
	
	
	@RequestMapping("/admin/adminmypage.do")
	public ModelAndView paymentList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=10;
		
		List<Map<String,String>> list=service.selectPaymentList(cPage,numPerPage);
		int totalCount=service.selectPaymentCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/dduck/admin/adminmypage.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("admin/adminOrder");
		
		return mv;
	}
}
