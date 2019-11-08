package com.kh.dduck.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dduck.panier.model.vo.Panier;
import com.kh.dduck.payment.model.dao.PaymentDao;
import com.kh.dduck.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertPayment(Payment p) {
		
		return dao.insertPayment(session, p);
	}

	@Override
	public int upDatePayment(Payment p) {
		return dao.upDatePayment(session,p);
	}

	@Override
	public int deletePanier(Panier pn) {
		
		return dao.deletePanier(session,pn);
	}

	
	
}
