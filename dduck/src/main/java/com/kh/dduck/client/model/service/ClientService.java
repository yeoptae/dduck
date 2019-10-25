package com.kh.dduck.client.model.service;

import com.kh.dduck.client.model.vo.Client;

public interface ClientService {

	/* 회원가입 */
	int insertClient(Client c);
	
	/* 로그인 */
	Client selectClientOne(Client c);
}
