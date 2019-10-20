package com.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.vo.LunchOrderInfo;


public interface HotellunchMapper{
		//分页查询订单信息
		List<LunchOrderInfo> findLunchOrders(
				@Param("username")String username,
				@Param("startIndex")Integer startIndex,
				@Param("pageSize")Integer pageSize);
		/***
		 * 基于条件查询总记录数
		 * @param username 查询条件
		 * @return 总记录数
		 */
		int getlunchRowCount(@Param("username")String username);
		
		
		int deletelunchOrders(String...ids);
		
}
