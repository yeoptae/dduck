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
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.common.PageBarFactory;


@Controller
public class AdminController {


	
	@Autowired
	AdminBoardService service;
	
	@RequestMapping("/admin/saleboardList.do")
	public ModelAndView saleboardList(@RequestParam(value="cPage",
	required=false, defaultValue="0") int cPage,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		int GCODE = Integer.parseInt(request.getParameter("GCODE"));
		int numPerPage=9;
		List<Map<String,String>> list=service.selectBoardList(cPage,numPerPage,GCODE);
		List<Map<String,String>> fileList=service.selectFile();
		System.out.println(fileList);
		System.out.println(list);
		int totlaCount=service.selectBoardCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totlaCount, cPage, numPerPage,"/dduck/admin/saleboardList.do"));
		mv.addObject("count",totlaCount);
		mv.addObject("list",list);
		mv.addObject("fileList",fileList);
		mv.addObject("GCODE",GCODE);
		mv.setViewName("saleboard/saleboardList");
		
		return mv;
	}
	
	@RequestMapping("/admin/mainpage.do")
	public String mainPage() {
		return "admin/main";
	}
	@RequestMapping("/admin/adminmypage.do")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	@RequestMapping("/admin/adminClientList.do")
	public String adminClietList() {
		return "admin/clientList";
	}
	@RequestMapping("/admin/adminQnaBoard.do")
     public String adminQnaBoard() {
		return "admin/adminQnaBoard";
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
}
