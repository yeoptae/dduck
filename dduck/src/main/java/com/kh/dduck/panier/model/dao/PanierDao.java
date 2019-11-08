package com.kh.dduck.panier.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.panier.model.vo.Panier;

public interface PanierDao {

	int insertPanier(SqlSessionTemplate session, Panier p);
	

	//장바구니삭제
	int deletePanier(SqlSessionTemplate session, Panier p);
	
	
	List<Map<String,String>> selectPanierList(SqlSessionTemplate session, int panierCode);
	int selectPanierCount(SqlSessionTemplate session, int panierCode);	
}
