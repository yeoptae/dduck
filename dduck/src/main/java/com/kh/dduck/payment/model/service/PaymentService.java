package com.kh.dduck.payment.model.service;

import com.kh.dduck.panier.model.vo.Panier;
import com.kh.dduck.payment.model.vo.Payment;

public interface PaymentService {
	
	int insertPayment(Payment p);
    int upDatePayment(Payment p);
    
    int deletePanier(Panier pn);
}
