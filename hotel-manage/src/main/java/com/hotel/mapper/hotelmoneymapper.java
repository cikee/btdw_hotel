package com.hotel.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hotel.pojo.hotelorder;
import com.hotel.vo.OrderInfo;
import com.hotel.vo.PageObject;
import com.hotel.vo.everydayOrdermoney;

@Mapper
public interface hotelmoneymapper {
	
  List<OrderInfo> findorderinfo(@Param("startIndex")Integer startIndex,
			@Param("pageSize")Integer pageSize,String start, String end);
  int getRowCount(String start, String end);
	List<everydayOrdermoney> findorderprice(String start,String end);
	
}
