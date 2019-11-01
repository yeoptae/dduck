package com.kh.dduck.adminboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SaleBoard {
  private int pCode;
  private int gCode;
  private String saleName;
  private int salePrice;
  private String detailsInfo;
}
