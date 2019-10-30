package com.kh.dduck.client.model.service;

import com.kh.dduck.client.model.vo.Client;

public interface ClientService {
	
	Client selectClientOne(Client c);
	int insertClient(Client c);
	int updateClient(Client c);
	Client selectClient(Client c,String mNo);
	int updatePw(Client c);
	
	

}
