package com.kh.dduck.client.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.client.model.vo.Client;

public interface ClientDao {
	Client selectClientOne(SqlSessionTemplate sqlSession,Client c);
	int insertClient(SqlSessionTemplate sqlSession,Client c);

}
