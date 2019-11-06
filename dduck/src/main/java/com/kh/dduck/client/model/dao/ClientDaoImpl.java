package com.kh.dduck.client.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.client.model.vo.Client;
import com.kh.dduck.panier.model.vo.Panier;

@Repository
public class ClientDaoImpl implements ClientDao {

	@Override
	public Client selectClientOne(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.selectOne("client.selectClientOne", c);
	}

	@Override
	public int insertClient(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.insert("client.insertClient", c);
	}

	@Override
	public int updateClient(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.update("client.updateClient",c);
	}

	@Override
	public Client selectClient(SqlSessionTemplate sqlSession, Client c, String mNo) {
		return sqlSession.selectOne("client.selectClient",mNo);
		/*매퍼에서 namespce.매퍼에서 id값*/
	}

	@Override
	public int updatePw(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.update("client.updatePw",c);
	}

	@Override
	public int deleteClient(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.delete("client.delete",c);
	}

	@Override
	public int updatePwChange(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.delete("client.updatePwChange",c);
	}

	@Override
	public int userIdCheck(SqlSessionTemplate sqlSession, String cId) {
		return sqlSession.selectOne("client.userIdCheck",cId);
	}
	
	@Override
	public int userMailCheck(SqlSessionTemplate sqlSession, String cEmail) {
		return sqlSession.selectOne("client.userMailCheck",cEmail);
	}
	
	//장바구니
	@Override
	public int selectPanierCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("client.selectPanierCount");
	}

	@Override
	public List<Map<String, String>> selectPanierList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String cId) {
		
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("client.selectPanierList",cId,rows);
	}
	
	
	
	//결제내역 
	@Override
	public int selectPaymentEndCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("client.selectPaymentEndCount");
	}

	@Override
	public List<Map<String, String>> selectPaymentEndList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,String cId) {
		
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("client.selectPaymentEndList",cId,rows);
	}
	

	

}
