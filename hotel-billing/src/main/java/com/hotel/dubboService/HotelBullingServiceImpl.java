package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hotel.dubbo.service.HotelBullingService;
import com.hotel.mapper.HotelBullingMapper;
import com.hotel.pojo.HotelRoom;
@Service
public class HotelBullingServiceImpl implements HotelBullingService {
	@Autowired
	private HotelBullingMapper hotelBullingMapper;

	@Override
	public List<HotelRoom> findAllRoom() {
		QueryWrapper<HotelRoom> queryWrapper = new QueryWrapper<>();
		List<HotelRoom> roomList = hotelBullingMapper.selectList(queryWrapper);
		return roomList;
	}
}
