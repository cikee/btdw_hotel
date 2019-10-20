package com.hotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.Daoservice.HotelOrderDao;
import com.hotel.dubbo.Daoservice.HotelRoomDao;
import com.hotel.dubbo.Daoservice.HotelStoreDao;
import com.hotel.pojo.HotelRoom;
import com.hotel.pojo.HotelStore;
import com.hotel.vo.OrderInfo;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {
	public HttpServletRequest request;
	
	@Reference(check=false)
	private HotelStoreDao hotelStoreDao;
	@Reference(check=false)
	private HotelRoomDao hotelRoomDao;
	@Reference(check=false)
	private HotelOrderDao hotelOrderDao;

	@RequestMapping("{UI}")
	public String UI(@PathVariable String UI) {
		return "reserve/" + UI;
	}

	@RequestMapping("reserve_hotel")
	public String findAllStore(Model model) {
		List<HotelStore> result = hotelStoreDao.findAllStore();
		int rows = hotelStoreDao.getRowCount();
		model.addAttribute("result", result);
		model.addAttribute("rows", rows);
		return "reserve/reserve_hotel";
	}

	@RequestMapping("reserve_room")
	public String findRoomByStoreId(Integer id, Model model) {
		List<HotelRoom> result = hotelRoomDao.findRoomByStoreId(id);
		model.addAttribute("result", result);
		return "reserve/reserve_room";
	}

	@RequestMapping("reserve_order")
	public String FindOrderinfo(Integer id, Model model, Double money) {

		List<HotelRoom> result = hotelRoomDao.findRoomToOrder(id);
		model.addAttribute("result", result);
		
		//model.addAttribute("money", money); 
		//model.addAttribute("id", id);
		
		return "reserve/reserve_order";
	}


	@RequestMapping("order_pay")
	public String WriteOrderinfo(HttpServletRequest request,OrderInfo orderInfo) {

		String time = orderInfo.getInDay() + "至" + orderInfo.getOutDay();
			orderInfo.setTime(time);
		hotelOrderDao.insertPayOrder(orderInfo);

		return "reserve/order_pay";
	}

}
