package com.kh.dduck.panier.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.panier.model.vo.Panier;

public interface PanierDao {

	int insertPanier(SqlSessionTemplate session, Panier p);
	
}
