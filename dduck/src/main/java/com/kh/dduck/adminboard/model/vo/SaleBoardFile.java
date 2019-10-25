package com.kh.dduck.adminboard.model.vo;



import java.sql.Date;

import lombok.Data;

@Data
public class SaleBoardFile {

  private int attachCode;
  private int pCode;
  private Date attachEN;
  private String attachReFileName;
  private int attachFlag;
	
}
