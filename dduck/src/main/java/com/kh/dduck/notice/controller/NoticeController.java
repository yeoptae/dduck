package com.kh.dduck.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dduck.common.PageBarFactory;
import com.kh.dduck.notice.model.service.NoticeService;
import com.kh.dduck.notice.model.vo.Notice;
import com.kh.dduck.notice.model.vo.NoticeFile;
import com.kh.dduck.qna.model.vo.Qna;

@Controller
public class NoticeController {

	@Autowired
	NoticeService service;
	
	
	/* notice 글쓰기 연결 */
	@RequestMapping("notice/noticeForm")
	public String noticeForm() {
		return "notice/noticeForm";
	}
	
	/* notice view 연결 */
	@RequestMapping("/notice/noticeView.do")
	public ModelAndView noticeView(int noticeCode) {
		ModelAndView mv=new ModelAndView();
		Map<String, String> notice=service.selectNotice(noticeCode);
		List<NoticeFile> ntf=service.selectNoticeFileList(noticeCode);
		
		mv.addObject("notice", notice);
		mv.addObject("noticeFile", ntf);
		mv.setViewName("notice/noticeView");
		return mv;
	}
	
	/* notice List 페이징처리 */
	@RequestMapping("/notice/noticeList.do")
	public ModelAndView noticeList(@RequestParam(value="cPage", 
	required=false, defaultValue="0") int cPage) {
		//반환될 modelandview객체를 생성
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=5;
		List<Map<String,String>> list=service.selectNoticeList(cPage,numPerPage);
		int totalCount=service.selectNoticeCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/dduck/notice/noticeList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("notice/noticeList");
		
		return mv;
	}

	/* notice 게시글 등록/파일업로드 */
	@RequestMapping("notice/noticeFormEnd.do")
	public ModelAndView insertNotice(@RequestParam Map<String, String> param,
			@RequestParam(value="upFile",required=false) MultipartFile[] upFile,HttpServletRequest request) {
		
		/* 파일업로드처리 */
		//1. 저장 경로
		String saveDir=request.getSession().getServletContext().getRealPath("resources/upload/notice");
		List<NoticeFile> NoticeFileList=new ArrayList();
		
		File dir=new File(saveDir);
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 재설정
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				//파일명 규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				//파일 저장
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				//DB에 데이터 저장
				NoticeFile ntf=new NoticeFile();
				ntf.setNoticeFileOri(reName);
				NoticeFileList.add(ntf);
			}
		}
		int result=0;
		try {
			result=service.insertNotice(param,NoticeFileList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg="";
		String loc="/notice/noticeList.do";
		if(result>0) {
			msg="입력성공";
		}else {
			msg="입력실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
			
	/* 첨부파일 다운로드 */
	@RequestMapping("/notice/noticeFileDown.do")
	public void noticeFIleDown(String oName, HttpServletRequest reqeust, HttpServletResponse response) {
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		
		String dir=reqeust.getSession().getServletContext().getRealPath("/resources/upload/notice");
		File saveFile=new File(dir+"/"+oName);
		try{
			FileInputStream fis=new FileInputStream(saveFile);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			String resFileName="";
			boolean isMSIE=reqeust.getHeader("user-agent").indexOf("MSIE")!=-1||
					reqeust.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				resFileName=URLEncoder.encode(oName,"UTF-8");
				resFileName=resFileName.replaceAll("\\+", "%20");
			}else {
				resFileName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition",
					"attachment;filename=\""+resFileName+"\"");
			response.setContentLength((int)saveFile.length());
			
			int read=0;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/* notice 삭제 */
	@RequestMapping("/notice/noticeDelete.do")
	public String noticeDelete(int noticeCode, Model model) {
		int result=service.noticeDelete(noticeCode);

		String msg = "";
		String loc = "";
		
		if (result > 0) {
			msg = "삭제 완료";
			loc = "/notice/noticeList.do";
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
	
	/* notice update 화면전환 */
	@RequestMapping("/notice/noticeUpdateForm.do")
	public ModelAndView noticeForm(int noticeCode) {
		ModelAndView mv=new ModelAndView();
		Map<String, String> notice=service.selectNotice(noticeCode);
		List<NoticeFile> ntf=service.selectNoticeFileList(noticeCode);
		
		
		mv.addObject("notice", notice);
		mv.addObject("noticeFile", ntf);
		mv.setViewName("notice/noticeUpdateForm");
		return mv;
	}
	
	/* notice update */
	@RequestMapping("/notice/noticeUpdateEnd.do")
	public String updateNotice(Notice n,int noticeCode, Model model,@RequestParam Map<String, String> param,
			@RequestParam(value="upFile",required=false) MultipartFile[] upFile, HttpServletRequest request) {
		int result2=service.deleteNoticeFile(noticeCode);
		int result =service.updateNotice(n);
		String saveDir=request.getSession().getServletContext().getRealPath("resources/upload/notice");
		List<NoticeFile> NoticeFileList=new ArrayList();
		
		File dir=new File(saveDir);
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 재설정
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				//파일명 규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				//파일 저장
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				//DB에 데이터 저장
				NoticeFile ntf=new NoticeFile();
				ntf.setNoticeFileOri(reName);
				NoticeFileList.add(ntf);
			}
		}
		int result3=0;
		try {
			result3=service.insertNoticeFile(n, NoticeFileList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		String msg ="";
		String loc ="";
		
		if(result>0) {
			msg = "수정 완료";
			loc="/notice/noticeView.do?noticeCode="+n.getNoticeCode();
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);

		}else {
			msg = "수정 실패";
			loc="/notice/noticeList.do";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		

		return "common/msg";

	}
}
