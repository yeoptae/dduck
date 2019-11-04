package com.kh.dduck.client.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dduck.client.model.vo.Client;
import com.kh.dduck.panier.model.vo.Panier;

public interface ClientService {
	
	Client selectClientOne(Client c);
	int insertClient(Client c);
	int updateClient(Client c);
	Client selectClient(Client c,String mNo);
	int updatePw(Client c);
	int deleteClient(Client c);
	int updatePwChange(Client c);
	
	
	
//	int withdrawer(Client c);
	
	//장바구니
	int selectPanierCount();
	List<Map<String,String>> selectPanierList(int cPage,int numPerPage,String cId);
	
	//결제내역
	int selectPaymentEndCount();
	List<Map<String,String>> selectPaymentEndList(int cPage,int numPerPage,String cId);
	
	
}
