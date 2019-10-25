package com.hotel.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 
 * 此vo对象完成封装订单信息,封装酒店表部分信息和房间表部分信息
 *
 */
@Data
@Accessors(chain=true)
public class OrderInfo implements Serializable{
	private static final long serialVersionUID = 2264844813586934204L;
	private Integer id;
	private String roomType;
	private String roomBedtype;
	private String roomBedsize;
	private String roomSize;
	private String roomFloor;
	private Double minPrice;
	private Double maxPrice;
	private String storeId;
	private String hotelAddr;
	private String hotelName;
	private String hotelPhone;
	
	private String inDay;
	private String outDay;
	
	private Double orderPrice;
	private String time;
	private String roomNum;
	private String orderId;
	private String userName;
	private String userPhone;
	private String loginUser;
}
