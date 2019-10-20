package com.hotel.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.HotelFoodOrderService;
import com.hotel.dubbo.service.HotelFoodService;
import com.hotel.dubbo.service.HotelUserService;
import com.hotel.pojo.HotelFood;
import com.hotel.pojo.HotelFoodOrder;
import com.hotel.pojo.HotelUser;

@Controller
@RequestMapping("/food/")
public class FoodController {
	@Reference(check=false)
	HotelFoodService hotelFoodService;
	
	@Reference(check=false)
	HotelFoodOrderService hotelFoodOrderService;
	
	@Reference(check=false)
	HotelUserService hotelUserService;

//	@RequestMapping("{ui}")
//	public String ss(@PathVariable String  ui) {
//		return "food/"+ui;
//	}

	@RequestMapping("hotel_food")
	public String UI() {
		return "food/hotel_food";
	}

	@RequestMapping("food_pay")
	public String UITest() {
		return "food/food_order_pay";
}
	
	@RequestMapping("selectObjectByMuneId")
	public String selectObjectByMuneId(int menuId, Model model) {
		List<HotelFood> foods = hotelFoodService.selectObjectByMuneId(menuId);
		// System.out.println(foods);
		
		model.addAttribute("foods", foods);
		return "forward:/food/hotel_food";

	}

	@RequestMapping("Hfood_order_pay")
	public String doFoodOrderPay(String ids,HttpSession session ) {
		System.out.println("ids" + ids);
		String[] str = ids.split(",");
		int[] in = new int[str.length];
		for (int i = 0; i < str.length; i++) {
			in[i] = Integer.parseInt(str[i]);
		}
		List<HotelFood> Foodlist = hotelFoodService.selectObjectByFoodId(in);
		String foodnames = "";
		double prices = 0;

		for (HotelFood food : Foodlist) {
			foodnames = food.getUsername() + "," + foodnames;
			prices += food.getPrice();
		}
    // 插入
		System.out.println(foodnames);
		System.out.println(prices);
		System.out.println(Foodlist);
//		HotelFoodOrder hOrder=new HotelFoodOrder();
//		hOrder.setFoodId(ids);
	  // hotelFoodOrderService.insertFoodOrderObject(order)
	 session.setAttribute("foodnames", foodnames);
	 session.setAttribute("prices", prices);
	 session.setAttribute("idss", in);
		return "food/food_order_pay";

	}
	@RequestMapping("hfood_order_pay")
	public String doOrder() {
		return "food/food_order_pay";
		
	}
	@RequestMapping("update_Order")
	public String update_Order(String ins,HttpSession session,Model model) {
		int[] attribute = (int[]) session.getAttribute("idss");
		model.addAttribute("Oid", attribute);
		System.out.println("ins"+Arrays.toString(attribute));
		return "forward:/food/hotel_food";
		
	}
	@RequestMapping("pay_Ok")
	public String pay_Ok(HotelFoodOrder order) {
		String username = order.getUserUsername();
		System.out.println("username"+username);
		HotelUser hotelUser = hotelUserService.selectLoginByUsername(username,username,username);
		String userPhone = hotelUser.getUserPhone();
		order.setUserPhone(userPhone);
		hotelFoodOrderService.insertFoodOrderObject(order);
		return "redirect:/food/hotel_food";
	}

}
