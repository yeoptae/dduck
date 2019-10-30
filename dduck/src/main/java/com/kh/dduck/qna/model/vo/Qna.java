package com.kh.dduck.qna.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	private int qaCode;			//qna번호
	private String cId;			//회원아이디
	private String qaTitle;		//제목
	private String qaComment;	//내용
	private Date qaEn;			//작성일
}
