package com.kh.dduck.client.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Client {

   private String cId;      //아이디
   private String cPw;       //비번
   private String cName;      //이름
   private String cEmail;   //이메일
   private String cPhone;   //휴대폰번호
   private String cAddr1;   //주소1
   private Date cEn;         //가입날짜
   private String cAddr2;   //주소2
   private String cAddr3;   //주소3
}