package com.kh.dduck.panier.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.panier.model.dao.PanierDao;
import com.kh.dduck.panier.model.vo.Panier;

@Service
public class PanierServiceImpl implements PanierService {

	@Autowired
	PanierDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertPanier(Panier p) {
		
		return dao.insertPanier(session, p);
	}
	
	//장바구니삭제
	@Override
	public int deletePanier(Panier p) {
		
		return dao.deletePanier(session,p);
	}

	
	@Override
	public List<Map<String, String>> selectPanierList(int panierCode) {
		
		return dao.selectPanierList(session, panierCode);
	}

	@Override
	public int selectPanierCount(int panierCode) {

		return dao.selectPanierCount(session, panierCode);
	}
	
	
	
	
	
}
