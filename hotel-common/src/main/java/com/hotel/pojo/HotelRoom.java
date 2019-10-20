package com.hotel.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelRoom extends BasePojo{
	private static final long serialVersionUID = 3594136813859621026L;
	
	Integer id;
	String roomType;
	String roomBedtype;
	String roomBedsize;
	String roomSize;
	String roomFloor;
	Double minPrice;
	Double maxPrice;
	String roomPeople;
	String storeId;
	String photoAddr;
	String hotelPhone;
}
