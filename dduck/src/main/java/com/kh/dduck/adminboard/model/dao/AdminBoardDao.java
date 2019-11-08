package com.kh.dduck.adminboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

public interface AdminBoardDao {

	
	/* 검색기능 ------------------------------------------ */
//	int selectBoardCount(SqlSessionTemplate session, String searchWord);
//	List<Map<String, Object>> searchList(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerpage, String searchWord);
	/* ------------------------------------------------ */
	
	int selectBoardCount(SqlSessionTemplate session);
	int selectBoardCount2(SqlSessionTemplate session,String searchWord);
	List<Map<String,String>> selectBoardList(SqlSessionTemplate session,int cPage,int numPerPage, String searchWord,int gCode);

	List<Map<String,String>> selectBoardList2(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList3(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList4(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList5(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList6(SqlSessionTemplate session);

	List<Map<String,String>> searchList(SqlSessionTemplate session,int cPage,int numPerPage, String searchWord);

	 
	List<Map<String,String>> selectFile(SqlSessionTemplate session);
	
	
	int insertBoard(SqlSessionTemplate session,Map<String,String> param);
	int insertBoardFile(SqlSessionTemplate session,SaleBoardFile boardFile);
	List<Map<String,String>> selectClientList(SqlSessionTemplate session,int cPage,int numPerPage,String keyword);
	List<Map<String,String>> selectClientList2(SqlSessionTemplate session,int cPage,int numPerPage);
	int selectClientCount(SqlSessionTemplate session);
	int selectClientCount2(SqlSessionTemplate session,String keyword);
	
	
	List<Map<String,String>> selectQnaBoard(SqlSessionTemplate session,int cPage,int numPerPage);
	int selecQnaCount(SqlSessionTemplate session);
	
	Map<String,Object> selectSaleBoard(SqlSessionTemplate session,int pCode);
	List<SaleBoardFile> selectSaleBoardFile(SqlSessionTemplate session,int pCode);
	
	int updateBoard(SqlSessionTemplate session,Map<String,Object> param);
	/* int updateBoardFile(SqlSessionTemplate session,SaleBoardFile boardFile); */
	
	int deleteSaleBoard(SqlSessionTemplate session,SaleBoard s);
	int deletePayment(SqlSessionTemplate session);
	int selectPaymentCount(SqlSessionTemplate session);
	List<Map<String,String>> selectPaymentList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int deleteBoardFile(SqlSessionTemplate session,int pCode);
	int deleteClient(SqlSessionTemplate sqlSession,Client c);  
}
