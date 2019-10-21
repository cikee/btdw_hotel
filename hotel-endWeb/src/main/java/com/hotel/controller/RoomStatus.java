package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/roomStatus")
public class RoomStatus {
	
//	@RequestMapping("/{restFul}")
//	public String restFul(@PathVariable String restFul) {
//		return restFul;
//	}
	
	@RequestMapping("Status")
	public String index() {
		return "Status";
	} 

}
