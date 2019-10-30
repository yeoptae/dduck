package com.kh.dduck.panier.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.panier.model.vo.Panier;

@Repository
public class PanierDaoImpl implements PanierDao {

	@Override
	public int insertPanier(SqlSessionTemplate session, Panier p) {
		
		return session.insert("panier.insertPanier",p);
	}
	
}
