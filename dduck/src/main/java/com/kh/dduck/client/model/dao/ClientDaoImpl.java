package com.kh.dduck.client.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.client.model.vo.Client;

@Repository
public class ClientDaoImpl implements ClientDao {

	/* 회원가입 */
	@Override
	public int insertClient(SqlSessionTemplate sqlSession, Client c) {
		System.out.println("회원가입dao");
		return sqlSession.insert("client.insertClient",c);
	}
	
	/* 로그인 */
	@Override
	public Client selectClientOne(SqlSessionTemplate sqlSession, Client c) {
		return sqlSession.selectOne("client.selectClientOne", c);
	}
}
