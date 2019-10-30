package com.kh.dduck.qna.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaComment {
	private int qmCode;			//댓글번호
	private int qaCode;			//qna참조번호
	private String cId;			//회원아이디
	private String cmContent;	//댓글내용
	private Date qmEn;			//작성일
}