package com.hotel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.HotelBullingService;
import com.hotel.pojo.HotelRoomStatus;

@Controller
@RequestMapping("/Billing/")
public class BillingController {
	@Reference
	private HotelBullingService hotelBullingService;
	
	@RequestMapping("{UI}")
	public String tglsIndex(@PathVariable String UI,Model model) {
		//查询所有的房间
		//List<HotelRoomStatus> roomList = hotelBullingService.findAllRoom();
		//查询经济房
		List<HotelRoomStatus> ecRoomList = hotelBullingService.findEconomyRoom();
		//查询经济房双人间
		List<HotelRoomStatus> ecDoubleRoomList = hotelBullingService.findEconomyDoubleRoom();
		//查询
		//model.addAttribute("roomList",roomList);
		model.addAttribute("ecRoomList",ecRoomList);
		model.addAttribute("ecDoubleRoomList",ecDoubleRoomList);
		return "/Billing/"+UI;
	}
	@RequestMapping("/fjkd")
	public String fjkd(HttpServletRequest request,Model model) {
		String[] ids = request.getParameterValues("fj[]");
		List<Integer> buildroomids = new ArrayList<>();
		for (String string : ids) {
			buildroomids.add(Integer.valueOf(string));
		}
		List<HotelRoomStatus>   roomList = hotelBullingService.findRoomByIds(buildroomids);
		model.addAttribute("buildroomids",buildroomids);
		return "/Billing/fjkd";
	}
	
}
