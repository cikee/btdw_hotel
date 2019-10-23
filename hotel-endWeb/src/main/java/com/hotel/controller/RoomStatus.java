package com.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.RoomStatusService;
import com.hotel.pojo.HotelRoomStatus;

@Controller
@RequestMapping("/RoomStatus")
public class RoomStatus {
	
	@Reference(check = false)
	private RoomStatusService roomStatusService; 
	
	
//	@RequestMapping("/{restFul}")
//	public String restFul(@PathVariable String restFul) {
//		return "RoomStatus/"+restFul;
//	}
	
	//房间状态显示
	@RequestMapping("/Status")
	public String Status(Model model , String dqfx) {
		
		List<HotelRoomStatus> roomStatus = roomStatusService.roomStatus();
		
		model.addAttribute("status", roomStatus);
		return "RoomStatus/Status";
	} 
	//宾客入住办理
	@RequestMapping("/fj_kd")
	public String fjkd(Model model , HotelRoomStatus room) {
		model.addAttribute("r", room);
		
		return "RoomStatus/fj_kd";
	} 
	
	

}
