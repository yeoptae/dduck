package com.kh.dduck.panier.model.service;

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
	
	
}
