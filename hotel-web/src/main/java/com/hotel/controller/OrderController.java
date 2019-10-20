package com.hotel.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.Daoservice.HotelUserDao;
import com.hotel.dubbo.service.OrderService;
import com.hotel.vo.HotelUserVo;
import com.hotel.vo.JsonResult;
import com.hotel.vo.LunchOrderInfo;
import com.hotel.vo.OrderInfo;
import com.hotel.vo.PageObject;



@RestController
public class OrderController {
	@Reference(check=false)
	private OrderService orderService;
	
	@Reference(check=false)
	private HotelUserDao hotelUserDao;
	
	 @RequestMapping("doFindPages")    
		public JsonResult doFindPages(
				String username,Integer pageCurrent) {
	    	PageObject<OrderInfo> pageObject = orderService.findPageObjects(username, pageCurrent);
	    	return new JsonResult(pageObject);
		}
	 @RequestMapping("doDeleteOrders")
	 public JsonResult doDeleteOrders(String...ids) {
		 orderService.deleteObjects(ids);
		 return new JsonResult("订单取消成功");
	 }
	 @RequestMapping("doFindUserInfo") 
	 public JsonResult doFindUserInfo(String username) {
		 HotelUserVo userInfo = hotelUserDao.findUserInfo(username);
		 return new JsonResult(userInfo);
	 }
	 @PostMapping("doUpdateUserInfo")
	 public JsonResult doUpdateObject(
			HotelUserVo user) {
		 hotelUserDao.updateUserInfo(user);
		 return new JsonResult("update ok");
	 }
	 @RequestMapping("dofindUserLunchOrderInfo")
	 public JsonResult dofindUserLunchOrderInfo(
			 String username,Integer pageCurrent) {
		 PageObject<LunchOrderInfo> findLunchOrders = orderService.findLunchOrders(username, pageCurrent);
		 return new JsonResult(findLunchOrders);
	 }
	 @RequestMapping("doDeletelunchOrders")
	 public JsonResult doDeletelunchOrders(String...ids) {
		 orderService.deletelunchObjects(ids);
		 return new JsonResult("订单取消成功");
	 }
}
