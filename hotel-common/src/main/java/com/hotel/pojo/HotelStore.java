package com.hotel.pojo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelStore extends BasePojo{
	private static final long serialVersionUID = 
			-272727272327503940L;
	Integer id;
	String hotelName;
	String hotelType;
	Double hotelMinprice;
	String hotelAddr;
	String hotelDistance;
	String photoAddr;
}
