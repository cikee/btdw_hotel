package com.hotel.dubbo.service;


import java.util.List;

import com.hotel.vo.LunchOrderInfo;
import com.hotel.vo.OrderInfo;
import com.hotel.vo.PageObject;

public interface OrderService {

	 /* 获取当前页的分析信息
     * @param username 用户名
     * @param pageCurrent 当前页页码
     * @return 封装了当前页记录以及页码信息的对象
     */
	 PageObject<OrderInfo> findPageObjects(
			 String username,
			 Integer pageCurrent);
	 /**
	  * 基于id执行删除业务
	 * @param ids
	 * @return
	 */
	int deleteObjects(String...ids);
	int deletelunchObjects(String...ids);
	
	/*查询订餐信息*/
	PageObject<LunchOrderInfo> findLunchOrders(
			String username,Integer pageCurrent);
	/*查询收入数据 $dada*/
	List<OrderInfo> findMoney(); 
	
}
