package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hotel.pojo.HotelRoomStatus;
import com.hotel.service.RoomStatusService;

@RestController
@RequestMapping("")
public class RoomStaut {
	
	@Autowired
	private RoomStatusService roomStatusService;
	
	@RequestMapping("Status")
	public List<HotelRoomStatus> roomStatus() {
		return roomStatusService.roomStatus();
	}
}
