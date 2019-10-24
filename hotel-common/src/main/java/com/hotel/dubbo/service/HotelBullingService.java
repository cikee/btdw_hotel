package com.hotel.dubbo.service;

import java.util.List;

import com.hotel.pojo.HotelRoom;

public interface HotelBullingService {

	List<HotelRoom> findAllRoom();
	
}
