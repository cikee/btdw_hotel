package com.hotel.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelFood extends BasePojo{
	private static final long serialVersionUID = 
			-2596999074495987794L;
	private int id;
	private String username;
	private double price;
	private String photoAddr;
	private int menuId;
	private String UserUsername;
}
