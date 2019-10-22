package com.hotel.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.service.RoomStatusService;
import com.hotel.mapper.RoomStatusMapper;
import com.hotel.pojo.HotelRoomStatus;

@Service   //alibaba.dubbo
public class RoomStatusServiceImpl implements RoomStatusService{
	@Autowired
	private RoomStatusMapper roomStatusMapper;

	@Override
	public List<HotelRoomStatus> roomStatus() {

		return roomStatusMapper.selectList(null);

	}



}
