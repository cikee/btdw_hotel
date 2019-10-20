package com.hotel.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class HotelRoom extends BasePojo{

	private static final long serialVersionUID = 3594136813859621026L;
	int id;
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
