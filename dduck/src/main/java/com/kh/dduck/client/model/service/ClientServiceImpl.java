package com.kh.dduck.client.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.client.model.dao.ClientDao;
import com.kh.dduck.client.model.vo.Client;

@Service
public class ClientServiceImpl implements ClientService {
	
	
	
	@Autowired
	ClientDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Client selectClientOne(Client c) {
		return dao.selectClientOne(sqlSession,c);
	}
	@Override
	public int insertClient(Client c) {
		return dao.insertClient(sqlSession,c);
	}
	
	//회원 정보수정
	@Override
	public int updateClient(Client c) {
		return dao.updateClient(sqlSession,c);
	}
	@Override
	public Client selectClient(Client c, String mNo) {
		return dao.selectClient(sqlSession, c,mNo);
	}
	
	//비번찾기후 수정
	@Override
	public int updatePw(Client c) {
		return dao.updatePw(sqlSession, c);
	}


	@Override
	public int deleteClient(Client c) {
		return dao.deleteClient(sqlSession, c);
	}
	@Override
	public int updatePwChange(Client c) {
		return dao.updatePwChange(sqlSession, c);
	}
	
	@Override
	public int userIdCheck(String cId) {
		return dao.userIdCheck(sqlSession, cId);
	}
	
	@Override
	public int userMailCheck(String cEmail) {
		return dao.userMailCheck(sqlSession, cEmail);
	}
	
	@Override
	public int userMailCheck2(String cEmail) {
		return dao.userMailCheck2(sqlSession, cEmail);
	}
	
	@Override
	public Client searchIdEnd(Client c ) {
		return dao.searchIdEnd(sqlSession,c);
	}
	
	//장바구니
	@Override
	public int selectPanierCount() {
		return dao.selectPanierCount(sqlSession);
	}
	@Override
	public List<Map<String, String>> selectPanierList(int cPage, int numPerPage,String cId) {
		
		return dao.selectPanierList(sqlSession,cPage,numPerPage,cId);
	}
	
	//결제내역
	@Override
	public int selectPaymentEndCount() {
		
		return dao.selectPaymentEndCount(sqlSession);
	}
	@Override
	public List<Map<String, String>> selectPaymentEndList(int cPage, int numPerPage, String cId) {
		
		return dao.selectPaymentEndList(sqlSession,cPage,numPerPage,cId);
	}

	
	
}
