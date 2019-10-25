package com.hotel.dubbo.service;

import java.util.List;

import com.hotel.pojo.HotelRoomStatus;


public interface HotelBullingService {

	List<HotelRoomStatus> findAllRoom();

	List<HotelRoomStatus> findEconomyRoom();

	List<HotelRoomStatus> findEconomyDoubleRoom();

	List<HotelRoomStatus> findRoomByIds(List<Integer> roomids);
}
