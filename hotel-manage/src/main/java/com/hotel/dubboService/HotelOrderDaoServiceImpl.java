package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotelOrderDao;
import com.hotel.mapper.HotelOrderMapper;
import com.hotel.vo.OrderInfo;


@Service //dubbo
public class HotelOrderDaoServiceImpl implements HotelOrderDao{

	@Autowired
	private HotelOrderMapper hotelOrderMapper;
	

	@Override
	public void insertPayOrder(OrderInfo orderInfo) {
		hotelOrderMapper.insertPayOrder(orderInfo);
	}

	@Override
	public List<OrderInfo> findPages(String username, Integer startIndex, Integer pageSize) {
		List<OrderInfo> findPages = hotelOrderMapper.findPages(username, startIndex, pageSize);
		return findPages;
	}

	@Override
	public int getRowCount(String username) {
		int rowCount = hotelOrderMapper.getRowCount(username);
		return rowCount;
	}

	@Override
	public int deleteOrders(String... ids) {
		int deleteOrders = hotelOrderMapper.deleteOrders(ids);
		return deleteOrders;
	}

	


}
