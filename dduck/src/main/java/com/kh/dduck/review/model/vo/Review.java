package com.kh.dduck.review.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo;
	private String cId;
	private Integer pCode;
	private Date reviewEn;
	private String reviewContent;
	private String reviewStar;
	
}
