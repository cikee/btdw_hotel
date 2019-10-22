package com.hotel.service;

import java.util.List;

import com.hotel.pojo.HotelRoomStatus;

public interface RoomStatusService{
	
	//查询所有记录 动态展示房态
	List<HotelRoomStatus> roomStatus();


}
