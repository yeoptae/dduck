package com.kh.dduck.client.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.client.model.vo.Client;

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

}
