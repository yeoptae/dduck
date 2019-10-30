package com.kh.dduck.client.model.service;

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
	
	//비번수정
	@Override
	public int updatePw(Client c) {
		return dao.updatePw(sqlSession, c);
	}
	
	
	
	
	

	
	
	/*
	 * @Override public Map<String, Object> selectClientInfo(Map<String,Object> map)
	 * throws Exception{ return dao.selectClientInfo(map); }
	 */


}
