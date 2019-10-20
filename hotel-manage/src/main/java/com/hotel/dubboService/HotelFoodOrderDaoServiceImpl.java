package com.hotel.dubboService;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;

import com.hotel.dubbo.Daoservice.HotelFoodOrderDao;
import com.hotel.mapper.HotelFoodOrderMapper;
import com.hotel.pojo.HotelFoodOrder;


@Service //dubbo
public class HotelFoodOrderDaoServiceImpl implements HotelFoodOrderDao{

	@Autowired
	private HotelFoodOrderMapper hotelFoodOrderMapper;
	
	@Override
	public int insertFoodOrderObject(HotelFoodOrder order) {
		int insertFoodOrderObject = hotelFoodOrderMapper.insertFoodOrderObject(order);
		return insertFoodOrderObject;
	}

	
}
