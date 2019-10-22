package com.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.RoomStatusService;
import com.hotel.pojo.HotelRoomStatus;

@Controller
@RequestMapping("/RoomStatus")
public class RoomStatus {
	
	@Reference(check = false)
	private RoomStatusService roomStatusService; 
	
	
	@RequestMapping("/{restFul}")
	public String restFul(@PathVariable String restFul) {
		return "RoomStatus/"+restFul;
	}
	
	@RequestMapping("/Status")
	public String Status(Model model) {
		List<HotelRoomStatus> roomStatus = roomStatusService.roomStatus();
		model.addAttribute("status", roomStatus);
		return "RoomStatus/Status";
	} 

}
