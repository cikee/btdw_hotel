package com.hotel.dubbo.service;

import java.util.List;

import com.hotel.pojo.HotelRoomStatus;

public interface RoomStatusService{
	
	//查询所有记录 动态展示房态
	List<HotelRoomStatus> roomStatus();

	String getRoomNumber(Integer fjbh);

	//根据房间号查询单带记录
	HotelRoomStatus findByRoomNumber(HotelRoomStatus room);
	
	


}
