package com.kh.dduck.adminboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;

public interface AdminBoardService {
	
	 int selectBoardCount();
	 List<Map<String,String>> selectBoardList(int cPage,int numPerpage,int gCode);
	 List<Map<String,String>> selectFile();
	 int insertBoard(Map<String, String> param,List<SaleBoardFile> boardFile) throws Exception;
	 
	 

}
