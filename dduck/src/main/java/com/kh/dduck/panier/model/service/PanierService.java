package com.kh.dduck.panier.model.service;

import com.kh.dduck.panier.model.vo.Panier;

public interface PanierService {
	
	int insertPanier(Panier p);
	
	//장바구니삭제
	int deletePanier(Panier p);
}
