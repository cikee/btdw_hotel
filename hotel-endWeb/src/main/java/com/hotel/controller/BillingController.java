package com.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.HotelBullingService;
import com.hotel.pojo.HotelRoom;

@Controller
@RequestMapping("/Billing/")
public class BillingController {
	@Reference
	private HotelBullingService hotelBullingService;
	
	@RequestMapping("{UI}")
	public String tglsIndex(@PathVariable String UI,Model model) {
		List<HotelRoom> roomList = hotelBullingService.findAllRoom();
		model.addAttribute("roomList",roomList);
		return "/Billing/"+UI;
	}
	
	
}
