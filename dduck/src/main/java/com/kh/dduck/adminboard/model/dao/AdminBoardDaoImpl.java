package com.kh.dduck.adminboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.adminboard.model.vo.SaleBoard;
import com.kh.dduck.adminboard.model.vo.SaleBoardFile;
import com.kh.dduck.client.model.vo.Client;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {
	
	/* 검색기능------------------------------------------- */
//	@Override
//	public int selectBoardCount(SqlSessionTemplate session, String searchWord) {
//		Map<String, Object> map=new HashMap<String, Object>();
//		map.put("SAERCHWORD",searchWord);
//		return Integer.parseInt(session.selectOne("board.selectBoardCount", map).toString());
//	}
//	@Override
//	public List<Map<String, Object>> searchList(SqlSessionTemplate session, Map<String, Object> map, int cPage, int numPerpage, String searchWord) {
//		
//		map.put("cPage", cPage);
//		map.put("numPerpage", numPerpage);
//		map.put("SEARCHWORD",searchWord);
//		
//		List<Map<String, Object>> list=session.selectList("board.searchList",map);
//		return list;
//	}
	/* ------------------------------------------------- */

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
	public int selectBoardCount2(SqlSessionTemplate session, String searchWord) {
		return session.selectOne("board.selectBoardCount2",searchWord);
	}
	@Override
	public List<Map<String, String>> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage, String searchWord, int gCode) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("searchWord", searchWord);
		map.put("gCode", gCode);
		return session.selectList("board.selectBoardList",map, rows);
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

	@Override
	public Map<String, Object> selectSaleBoard(SqlSessionTemplate session, int pCode) {
		return session.selectOne("board.selectSaleBoard",pCode);
		
	}

	@Override
	public List<SaleBoardFile> selectSaleBoardFile(SqlSessionTemplate session, int pCode) {
		return session.selectList("board.selectSaleBoardFile",pCode);
		
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("board.updateBoard",param);
	}

	@Override
	public int updateBoardFile(SqlSessionTemplate session, SaleBoardFile boardFile) {
		return session.update("board.updateBoardFile",boardFile);
	}

	@Override
	public int deleteSaleBoard(SqlSessionTemplate session, SaleBoard s) {
		return session.delete("board.deleteSaleBoard",s);
	}

	@Override
	public int deletePayment(SqlSessionTemplate session) {
		return session.delete("payment.deletePayment");
	}
     
	
	
	
	
	@Override
	public int selectPaymentCount(SqlSessionTemplate session) {

		return session.selectOne("payment.selectPaymentCount");
	}

	@Override
	public List<Map<String, String>> selectPaymentList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("payment.selectPaymentList",null,rows);
	}

	
	
	
}
