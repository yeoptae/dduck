package com.kh.dduck.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.payment.model.vo.Payment;

public interface PaymentDao {

	int insertPayment(SqlSessionTemplate session, Payment p);
	
}
