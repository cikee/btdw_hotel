package com.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.service.HotelFoodService;
import com.hotel.mapper.HotelFoodMapper;
import com.hotel.pojo.HotelFood;
@Service //dubbo
public class HotelFoodServiceImpl implements HotelFoodService{
	@Autowired
	private HotelFoodMapper hotelFoodMapper;
	@Override
	public List<HotelFood> selectObjectByMuneId(int menuId) {
		
		List<HotelFood> hotelFood = hotelFoodMapper.selectObjectByMuneId(menuId);
	    
		return hotelFood;
	}
	@Override
	public List<HotelFood> selectObjectByFoodId(int... ids) {
		List<HotelFood> list = hotelFoodMapper.selectObjectByFoodId(ids);
		
		return list;
	}

}
