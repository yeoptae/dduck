package com.kh.dduck.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.dduck.panier.model.vo.Panier;
import com.kh.dduck.payment.model.vo.Payment;

public interface PaymentDao {

	int insertPayment(SqlSessionTemplate session, Payment p);
	int upDatePayment(SqlSessionTemplate session,Payment p);
	int deletePanier(SqlSessionTemplate session, Panier pn);
}
