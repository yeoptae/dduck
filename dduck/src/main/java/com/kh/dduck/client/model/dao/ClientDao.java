package com.kh.dduck.client.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.client.model.vo.Client;


public interface ClientDao {
	Client selectClientOne(SqlSessionTemplate sqlSession,Client c);
	int insertClient(SqlSessionTemplate sqlSession,Client c);
	int updateClient(SqlSessionTemplate sqlSession,Client c);
	Client selectClient(SqlSessionTemplate sqlSession,Client c, String mNo);
	int updatePw(SqlSessionTemplate sqlSession,Client c);
	int deleteClient(SqlSessionTemplate sqlSession,Client c);
	int updatePwChange(SqlSessionTemplate sqlSession, Client c);
	
//	int withdraw(SqlSessionTemplate sqlSession,Client c);

	
	
	
	
	
}
