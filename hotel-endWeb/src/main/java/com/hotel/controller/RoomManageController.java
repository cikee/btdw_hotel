package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/RoomManage/")
public class RoomManageController {
	
	@RequestMapping("roomType_set")
	public String roomTypeSet() {
		return "RoomManage/roomTypeSet";
	}
}
