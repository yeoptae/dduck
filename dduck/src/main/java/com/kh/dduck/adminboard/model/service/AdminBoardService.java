package com.kh.dduck.adminboard.model.service;

import java.util.List;
import java.util.Map;
import com.kh.dduck.client.model.vo.Client;
import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;

public interface AdminBoardService {
	
	/* 검색기능 */
	//int selectBoardCount(String searchWord) throws Exception;
	//List<Map<String, Object>> searchList(Map<String,Object> map,int cPage,int numPerpage,String searchWord) throws Exception;
	 
	 int selectBoardCount();
	 int selectBoardCount2(String searchWord);

	 List<Map<String,String>> selectBoardList(int cPage,int numPerpage,String searchWord,int gCode);

	 List<Map<String,String>> selectBoardList2();
	 List<Map<String,String>> selectBoardList3();
	 List<Map<String,String>> selectBoardList4();
	 List<Map<String,String>> selectBoardList5();
	 List<Map<String,String>> selectBoardList6();

	 List<Map<String,String>> searchList(int cPage,int numPerpage,String searchWord);

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
      
     int deleteClient(Client c);
   
}
