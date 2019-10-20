package com.hotel.dubbo.service;

import java.util.List;

import com.hotel.pojo.HotelFood;

public interface HotelFoodService {

	List<HotelFood> selectObjectByMuneId(int menuId);
	
	List<HotelFood> selectObjectByFoodId(int... id);
}
