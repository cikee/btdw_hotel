package com.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.service.HotelFoodOrderService;
import com.hotel.mapper.HotelFoodOrderMapper;
import com.hotel.pojo.HotelFoodOrder;

@Service //dubbo
public class HotelFoodOrderServiceImpl implements HotelFoodOrderService{
	
	@Autowired
	private HotelFoodOrderMapper hotelFoodOrderMapper;
	
	@Override
	public int insertFoodOrderObject(HotelFoodOrder order) {

		int insertFoodOrderObject = hotelFoodOrderMapper.insertFoodOrderObject(order);
		return insertFoodOrderObject;
	}

}
