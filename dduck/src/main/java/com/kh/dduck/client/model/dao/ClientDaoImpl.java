package com.kh.dduck.client.model.dao;

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

	

	
	

	
	

}
