package com.kh.dduck.adminboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;

public interface AdminBoardService {
	
	 
	int selectBoardCount();

	 List<Map<String,String>> selectBoardList(int cPage,int numPerpage,int gCode);
	 List<Map<String,String>> selectFile();
	 
	 int insertBoard(Map<String, String> param,List<SaleBoardFile> boardFile) throws Exception;

	 List<Map<String,String>> selectClientList(int cPage,int numPerpage,String keyword);
	  List<Map<String,String>> selectClientList2(int cPage,int numPerpage);
	 int selectClientCount();
	 int selectClientCount2(String keyword);
	 
	 List<Map<String,String>> selectQnaBoard(int cPage,int numPerPage);
	 int selectQnaCount();
	 
	 Map<String,Object> selectSaleBoard(int pCode);
	 List<SaleBoardFile> selectSaleBoardFile(int pCode);
	 
	 int updateBoard(Map<String, Object> param,List<SaleBoardFile> boardFile) throws Exception;

     int deleteSaleBoard(SaleBoard s);
	 
	 
	 List<Map<String,String>> selectPaymentList(int cPage,int numPerPage);
	 int selectPaymentCount();

   int deleteBoardFile(int pCode);
}
