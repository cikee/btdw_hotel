package com.hotel.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.OrderService;
import com.hotel.vo.JsonResult;
import com.hotel.vo.OrderInfo;

@Controller
@RequestMapping("/echarts/")
public class MoneyController {
	@Reference(check = false)
	private OrderService orderService;
	//http://localhost:8082/echarts/queryBarGraphList
	@RequestMapping("queryBarGraphList")
	@ResponseBody
	public JsonResult dofindmoney() {
		List<OrderInfo> moneyInfos=orderService.findMoney();
		return new JsonResult(moneyInfos);
	}
}
