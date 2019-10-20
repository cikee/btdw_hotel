package com.hotel.dubbo.Daoservice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.vo.OrderInfo;

public interface HotelOrderDao {
	//保存用户提交订单的订单数据到数据库中
	void insertPayOrder(OrderInfo orderInfo);
	
	//分页查询订单信息
	List<OrderInfo> findPages(
			@Param("userName")String username,
			@Param("startIndex")Integer startIndex,
			@Param("pageSize")Integer pageSize);
	/***
	 * 基于条件查询总记录数
	 * @param username 查询条件
	 * @return 总记录数
	 */
	int getRowCount(@Param("userName")String username);
	
	/**
	  * 基于id执行日志删除操作
	 * @param ids
	 * @return
	 */
	int deleteOrders(String...ids);
}
