package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/RoomStatus/")
public class RoomStatusController {

	@RequestMapping("{UI}")
	public String aboutfind(@PathVariable String UI) {
		return "RoomStatus/"+UI;
	}
	
}
