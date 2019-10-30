package com.kh.dduck.adminboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

public interface AdminBoardDao {

	
	int selectBoardCount(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList(SqlSessionTemplate session,int cPage,int numPerPage,int gCode);

	
	 
	List<Map<String,String>> selectFile(SqlSessionTemplate session);
	
	
	int insertBoard(SqlSessionTemplate session,Map<String,String> param);
	int insertBoardFile(SqlSessionTemplate session,SaleBoardFile boardFile);
	List<Map<String,String>> selectClientList(SqlSessionTemplate session,int cPage,int numPerPage);
	int selectClientCount(SqlSessionTemplate session);
	
	
	List<Map<String,String>> selectQnaBoard(SqlSessionTemplate session,int cPage,int numPerPage);
	int selecQnaCount(SqlSessionTemplate session);
}
