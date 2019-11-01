package com.kh.dduck.adminboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

public interface AdminBoardService {
	
	 
	int selectBoardCount();

	 List<Map<String,String>> selectBoardList(int cPage,int numPerpage,int gCode);
	 List<Map<String,String>> selectFile();
	 int insertBoard(Map<String, String> param,List<SaleBoardFile> boardFile) throws Exception;

	 List<Map<String,String>> selectClientList(int cPage,int numPerpage);
	 int selectClientCount();
	 
	 List<Map<String,String>> selectQnaBoard(int cPage,int numPerPage);
	 int selectQnaCount();
	 
	 List<Map<String,String>> selectPaymentList(int cPage,int numPerPage);
	 int selectPaymentCount();

}
