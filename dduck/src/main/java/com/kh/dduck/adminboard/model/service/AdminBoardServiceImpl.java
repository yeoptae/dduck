package com.kh.dduck.adminboard.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.adminboard.model.dao.AdminBoardDao;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public int insertBoard(Map<String, String> param, List<SaleBoardFile> boardFile) throws Exception {
		int result=0;
		result=dao.insertBoard(session, param);
		if(result == 0) throw new RuntimeException();
		if(boardFile.size()>0) {
		for(SaleBoardFile a : boardFile) {
		  a.setPCode(Integer.parseInt(param.get("pCode")));
	      result=dao.insertBoardFile(session,a);
	      if(result == 0) throw new Exception();
		}
	}
		return result;
	}


	@Override
	public int selectBoardCount() {
		// TODO Auto-generated method stub
		return dao.selectBoardCount(session);
	}


	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerpage,int gCode) {
		// TODO Auto-generated method stub
		return dao.selectBoardList(session,cPage,numPerpage,gCode);
	}

	
	
	 
	@Override
	public List<Map<String, String>> selectFile() {
		// TODO Auto-generated method stub
		return dao.selectFile(session);
	}


	@Override
	public List<Map<String, String>> selectClientList(int cPage,int numPerpage) {
		
		return dao.selectClientList(session,cPage,numPerpage);
	}


	@Override
	public int selectClientCount() {
		return  dao.selectClientCount(session);
	}


	@Override
	public List<Map<String, String>> selectQnaBoard(int cPage, int numPerPage) {
		return dao.selectQnaBoard(session,cPage,numPerPage);
	}


	@Override
	public int selectQnaCount() {
		return dao.selectBoardCount(session);
	}
	
	
	
	
	
	

}
