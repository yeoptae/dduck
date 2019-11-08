package com.kh.dduck.panier.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.panier.model.vo.Panier;

public interface PanierService {
	
	int insertPanier(Panier p);
	
	//장바구니삭제
	int deletePanier(Panier p);
	
	List<Map<String,String>> selectPanierList(int panierCode);
	int selectPanierCount(int panierCode);
	
}
