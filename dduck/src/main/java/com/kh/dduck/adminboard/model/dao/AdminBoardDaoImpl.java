package com.kh.dduck.adminboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

//	@Override
	public int insertBoard(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("board.insertBoard",param);
	}

	@Override
	public int insertBoardFile(SqlSessionTemplate session, SaleBoardFile boardFile) {
		return session.insert("board.insertBoardFile",boardFile);
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public List<Map<String, String>> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage,int gCode) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("board.selectBoardList",gCode,rows);
	}
	
	
	
	
	 
	 

	@Override
	public List<Map<String, String>> selectFile(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectFile");
	}

	@Override
	public List<Map<String, String>> selectClientList(SqlSessionTemplate session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("client.selectClientList",null,rows);
		                                              /* parameter */
	}

	@Override
	public int selectClientCount(SqlSessionTemplate session) {
		return session.selectOne("client.selectClientCount");
	}

	@Override
	public List<Map<String, String>> selectQnaBoard(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("qnaBoard.selectQnaBoard",null,rows);
	}

	@Override
	public int selecQnaCount(SqlSessionTemplate session) {
		return session.selectOne("qnaBoard.selectQnaCount");
	}
	
}
