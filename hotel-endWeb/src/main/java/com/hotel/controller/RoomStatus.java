package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/RoomStatus")
public class RoomStatus {
	
	@RequestMapping("/{restFul}")
	public String restFul(@PathVariable String restFul) {
		return "RoomStatus/"+restFul;
	}
	
	@RequestMapping("/Status")
	public String Status() {
		return "RoomStatus/Status";
	} 

}
