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
	
	/* 회원가입  */
	@Override
	public int insertClient(Client c) {
		System.out.println("회원가입service");
		return dao.insertClient(sqlSession, c);
	}
	
	/* 로그인  */
	@Override
	public Client selectClientOne(Client c) {
		return dao.selectClientOne(sqlSession,c);
	}

}
