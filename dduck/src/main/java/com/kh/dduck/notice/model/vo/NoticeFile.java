package com.kh.dduck.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeFile {

	private int noticeFileCode;
	private int noticeCode;
	private String cId;
	private String noticeFileOri;
	private Date noticeFileEn;
	
}
