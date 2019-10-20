package com.hotel.mapper;

import java.util.List;

import com.hotel.pojo.HotelFood;


public interface HotelFoodMapper{

	List<HotelFood> selectObjectByMuneId(int menuId);
	
	List<HotelFood> selectObjectByFoodId(int... id);
}
