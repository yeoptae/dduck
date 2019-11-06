package com.kh.dduck.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dduck.payment.model.vo.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Override
	public int insertPayment(SqlSessionTemplate session, Payment p) {
		
		return session.insert("payment.insertPayment",p);
	}

	@Override
	public int upDatePayment(SqlSessionTemplate session, Payment p) {
		return session.update("payment.upDatePayment",p);
	}

	
	
}
