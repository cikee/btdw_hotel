package com.hotel.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 * 此vo对象完成封装订单信息,封装酒店表部分信息和房间表部分信息
 *
 */
@Data
public class LunchOrderInfo implements Serializable{
	private static final long serialVersionUID = 2264844813586934204L;
	int id;
	String username;
	String ordername;
	Double price;
	String orderid;
	String userphone;
	Date ordertime;
}
