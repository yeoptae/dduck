package com.kh.dduck.adminboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.adminboard.model.vo.SaleBoardFile;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

	@Override
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

	
	
}
