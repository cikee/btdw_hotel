package com.hotel.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class everydayOrdermoney implements Serializable{
   /**
	 * 封装每天酒店收入的日期和总额信息
	 */
	private static final long serialVersionUID = 3057979187147008456L;
private String day;
   private Double countmoney;
   private String start;
   private String end;
   
}
