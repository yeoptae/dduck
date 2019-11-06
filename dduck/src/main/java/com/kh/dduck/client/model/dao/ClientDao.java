package com.kh.dduck.client.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.client.model.vo.Client;
import com.kh.dduck.panier.model.vo.Panier;


public interface ClientDao {
	Client selectClientOne(SqlSessionTemplate sqlSession,Client c);
	int insertClient(SqlSessionTemplate sqlSession,Client c);
	int updateClient(SqlSessionTemplate sqlSession,Client c);
	Client selectClient(SqlSessionTemplate sqlSession,Client c, String mNo);
	int updatePw(SqlSessionTemplate sqlSession,Client c);
	int deleteClient(SqlSessionTemplate sqlSession,Client c);
	int updatePwChange(SqlSessionTemplate sqlSession, Client c);
	int userIdCheck(SqlSessionTemplate sqlSession, String cId);
	int userMailCheck(SqlSessionTemplate sqlSession, String cEmail);
	
//	int withdraw(SqlSessionTemplate sqlSession,Client c);

	
	//장바구니
	int selectPanierCount(SqlSessionTemplate sqlSession);
	List<Map<String,String>> selectPanierList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String cId);
	
	//결제내역
	int selectPaymentEndCount(SqlSessionTemplate sqlSession);
	List<Map<String,String>> selectPaymentEndList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,String cId);
	
	
}
