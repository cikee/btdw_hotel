package com.hotel.mapper;

import java.util.List;

import com.hotel.pojo.HotelRoom;

public interface HotelRoomMapper{
	//根据酒店店铺的id获得该酒店的房间信息
	List<HotelRoom> findRoomByStoreId(Integer id);
	
	//根据房间id获得该房间的信息提供给填写订单页面
	List<HotelRoom> findRoomToOrder(Integer id);
}
