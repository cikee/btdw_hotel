package com.hotel.controller;


import java.util.Map;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.service.OrderService;
import com.hotel.vo.JsonResult;


@RestController
public class MoneyController {
	@Reference(check = false)
	private OrderService orderService;
	//http://localhost:8082/echarts/queryBarGraphList按照日期查询每天酒店收入
	@RequestMapping("/echarts/queryBarGraphList")
	public JsonResult dofindmoney(String start,String end) {
		Map<String, Object> map = orderService.findMoney(start,end);
		return new JsonResult(map);
	}
	//layui中表格的数据接口请求路径
	 @RequestMapping("/Money/doFindPages") 
		public JsonResult doFindPages(String start,String end,Integer pageCurrent,Integer pageSize) {
		 JsonResult jsonResult=orderService.findMoneyinfo(start,end,pageCurrent,pageSize);
	    	return jsonResult;
		}
}
