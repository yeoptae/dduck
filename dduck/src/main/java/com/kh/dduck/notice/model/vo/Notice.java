package com.kh.dduck.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {

	private int noticeCode;
	private String cId;
	private String noticeTitle;
	private Date noticeEn;
	private String noticeContent;
	private int noticeCategory;
	private int noticeCount;
}
