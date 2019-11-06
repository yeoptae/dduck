package com.kh.dduck.payment.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	
	private int payCode;
	private String cId;
	private int pCode;
	private int payAmount;
	private int payPrice;
	private Date payDeliveryen;
	private Date payDay;
	private String payMemo; 
	private String payAddr1;
	private String payAddr2;
	private String payAddr3;
	private String payTime;
	private String payPhone;
	private String payName;
	private int dCheck;
	
}
