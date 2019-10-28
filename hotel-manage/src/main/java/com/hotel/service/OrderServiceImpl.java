package com.hotel.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.dubbo.qos.command.impl.Ls;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hotel.annotation.Cache_Find;
import com.hotel.dubbo.service.OrderService;
import com.hotel.exception.ServiceException;
import com.hotel.mapper.HotelOrderMapper;
import com.hotel.mapper.HotellunchMapper;
import com.hotel.mapper.hotelmoneymapper;
import com.hotel.pojo.hotelorder;
import com.hotel.util.ObjectMapperUtil;
import com.hotel.vo.JsonResult;
import com.hotel.vo.LunchOrderInfo;
import com.hotel.vo.OrderInfo;
import com.hotel.vo.PageObject;
import com.hotel.vo.everydayOrdermoney;

@Service //dubbo
public class OrderServiceImpl implements OrderService{

	@Autowired
	private HotelOrderMapper hotelOrderMapper;

	@Autowired
	private HotellunchMapper hotellunchMapper;
	@Override
	public PageObject<OrderInfo> findPageObjects(String username, Integer pageCurrent) {
		//1.验证当前页码值是否合法
		if(pageCurrent==null||pageCurrent<1)
			throw new IllegalArgumentException("当前页码值不正确");
		//2.基于用户名查询总记录数并进行校验
		int rowCount=hotelOrderMapper.getRowCount(username);
		if(rowCount==0)
			throw new ServiceException("记录不存在");
		//3.查询当前页记录
		Integer pageSize=3;
		Integer startIndex=(pageCurrent-1)*pageSize;
		List<OrderInfo> records=
				hotelOrderMapper.findPages(username,
						startIndex, pageSize);
		//4.封装查询结果并返回
		return new PageObject<>(
				rowCount, records,pageCurrent, pageSize);
	}
	@Override
	public int deleteObjects(String... ids) {
		//1.参数校验
		if(ids==null||ids.length==0)
			throw new IllegalArgumentException("必须先选中");
		//2.执行删除
		int rows=hotelOrderMapper.deleteOrders(ids);
		//3.判定结果
		if(rows==0)
			throw new ServiceException("记录可能已经不存在");

		return rows;
	}
	@Override
	public PageObject<LunchOrderInfo> findLunchOrders(String username, Integer pageCurrent) {
		//1.验证当前页码值是否合法
		if(pageCurrent==null||pageCurrent<1)
			throw new IllegalArgumentException("当前页码值不正确");
		//2.基于用户名查询总记录数并进行校验
		int rowCount=hotellunchMapper.getlunchRowCount(username);
		if(rowCount==0)
			throw new ServiceException("记录不存在");
		//3.查询当前页记录
		Integer pageSize=3;
		Integer startIndex=(pageCurrent-1)*pageSize;
		List<LunchOrderInfo> records=
				hotellunchMapper.findLunchOrders(username, startIndex, pageSize);
		//4.封装查询结果并返回
		PageObject<LunchOrderInfo> pObj = new PageObject<>(rowCount, records, pageCurrent, pageSize);
		return pObj;
	}
	@Override
	public int deletelunchObjects(String... ids) {
		//1.参数校验
		if(ids==null||ids.length==0)
			throw new IllegalArgumentException("必须先选中");
		//2.执行删除
		int rows=hotellunchMapper.deletelunchOrders(ids);
		//3.判定结果
		if(rows==0)
			throw new ServiceException("记录可能已经不存在");

		return rows;
	}
	/*查询每天酒店收入 $dada*/
	@Autowired
	private hotelmoneymapper hotelmoneymapper;
	@Cache_Find
	@Override
	public Map<String, Object> findMoney(String start,String end) {
	//echarts图表需要返回map<k:v(list)>
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<Object> daylist = new ArrayList<Object>();
		ArrayList<Object> monlist = new ArrayList<Object>();
		  List<everydayOrdermoney> moneylist = hotelmoneymapper.findorderprice(start,end);
		  for (everydayOrdermoney everydayOrdermoney : moneylist) {
			String day1 = everydayOrdermoney.getDay();		
			daylist.add(day1);
			Double money1 = everydayOrdermoney.getCountmoney();
			Double money = Double.valueOf(money1);
			monlist.add(money);
			map.put("countTime", daylist);
			map.put("orderPrice", monlist);
		}
		  
		return map;
	}
	//查询用户选择日期范围内的酒店收入的明细
	@Cache_Find
	@Override
	public JsonResult findMoneyinfo(String start, String end,Integer pageCurrent,Integer pageSize) {
		
				//2.基于用户名查询总记录数并进行校验
				int rowCount=hotelmoneymapper.getRowCount(start,end);
				if(rowCount==0)
					throw new ServiceException("记录不存在");
				//3.查询当前页记录
				Integer startIndex=(pageCurrent-1)*pageSize;
				List<OrderInfo> records=hotelmoneymapper.findorderinfo(startIndex, pageSize,start,end);
				//4.封装查询结果并返回
				PageObject<OrderInfo> pageObject = new PageObject<>(rowCount, records, pageCurrent, pageSize);
			JsonResult jsonResult = new JsonResult(rowCount,records);
			System.out.println(jsonResult);
				return jsonResult;
	
	}
   
}
