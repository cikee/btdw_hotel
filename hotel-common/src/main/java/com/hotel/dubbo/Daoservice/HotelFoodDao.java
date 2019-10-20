package com.hotel.dubbo.Daoservice;

import java.util.List;


import com.hotel.pojo.HotelFood;


public interface HotelFoodDao {

	List<HotelFood> selectObjectByMuneId(int menuId);
	
	List<HotelFood> selectObjectByFoodId(int... id);
}
