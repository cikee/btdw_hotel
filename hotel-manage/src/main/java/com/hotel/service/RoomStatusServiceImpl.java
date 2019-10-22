package com.hotel.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hotel.mapper.RoomStatusMapper;
import com.hotel.pojo.HotelRoomStatus;

@Service
public class RoomStatusServiceImpl implements RoomStatusService{
	@Autowired
	private RoomStatusMapper roomStatusMapper;

	@Override
	public List<HotelRoomStatus> roomStatus() {

		return roomStatusMapper.selectList(null);

	}



}
