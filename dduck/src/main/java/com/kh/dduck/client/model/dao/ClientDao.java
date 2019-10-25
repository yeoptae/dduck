package com.kh.dduck.client.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.client.model.vo.Client;

public interface ClientDao {
	
	/* 회원가입 */
	int insertClient(SqlSessionTemplate sqlSession, Client c);
	
	/* 로그인  */
	Client selectClientOne(SqlSessionTemplate sqlSession,Client c);
}
