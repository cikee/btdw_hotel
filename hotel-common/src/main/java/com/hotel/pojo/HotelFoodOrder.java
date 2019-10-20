package com.hotel.pojo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelFoodOrder extends BasePojo{
	private static final long serialVersionUID = 
			1969885044958288428L;
	private int id;
	private String OrderId;
	private String userPhone;
	private String UserUsername;
	private String  foodId;
	private String OrderFoodName;
	private Double price;
	private Date orderTime;
}
