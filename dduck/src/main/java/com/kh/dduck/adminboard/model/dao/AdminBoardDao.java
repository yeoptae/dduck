package com.kh.dduck.adminboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;

public interface AdminBoardDao {

	
	int selectBoardCount(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList(SqlSessionTemplate session,int cPage,int numPerPage,int gCode);
	List<Map<String,String>> selectFile(SqlSessionTemplate session);
	
	
	int insertBoard(SqlSessionTemplate session,Map<String,String> param);
	int insertBoardFile(SqlSessionTemplate session,SaleBoardFile boardFile);
}
