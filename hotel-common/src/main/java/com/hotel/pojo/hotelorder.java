package com.hotel.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
@JsonIgnoreProperties(ignoreUnknown=true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@TableName("hotel_order")
public class hotelorder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7246880632809943859L;
	@TableId(type = IdType.AUTO)
	private int id;
	private String hotelAddr;
	private String userName;
	private String userPhone;
	private String hotelName;
	private String hotelPhone;
	private String orderId;
	private String roomType;
	private String storeId;
	private Double orderPrice;
	private String time;
	private String roomNum;
	private String loginUser;
	private String createTime;
	private String updateTime;
	private int status;

	
	

}
