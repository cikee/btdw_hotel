package com.hotel.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class HotelStore extends BasePojo{
	private static final long serialVersionUID = -272727272327503940L;
	int id;
	String hotelName;
	String hotelType;
	Double hotelMinprice;
	String hotelAddr;
	String hotelDistance;
	String photoAddr;
}
