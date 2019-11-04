package com.kh.dduck.panier.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Panier {

	private int panierCode;
	private String cId;
	private int pCode;
	private Date panierEn;
	private int panierAmount;

}
