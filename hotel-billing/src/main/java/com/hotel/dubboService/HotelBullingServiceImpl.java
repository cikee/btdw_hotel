package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hotel.dubbo.service.HotelBullingService;
import com.hotel.mapper.HotelBullingMapper;
import com.hotel.pojo.HotelRoom;
import com.hotel.pojo.HotelRoomStatus;
@Service
public class HotelBullingServiceImpl implements HotelBullingService {
	@Autowired
	private HotelBullingMapper hotelBullingMapper;

	//查询所有的房间
	@Override
	public List<HotelRoomStatus> findAllRoom() {
		QueryWrapper<HotelRoomStatus> queryWrapper = new QueryWrapper<>();
		List<HotelRoomStatus> roomList = hotelBullingMapper.selectList(queryWrapper);
		return roomList;
	}
	//查询所有的经济房单间
	@Override
	public List<HotelRoomStatus> findEconomyRoom() {
		QueryWrapper<HotelRoomStatus> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("room_name", "经济型")
					.eq("room_status", 1);
		List<HotelRoomStatus> roomList = hotelBullingMapper.selectList(queryWrapper);
		return roomList;
	}
	@Override
	public List<HotelRoomStatus> findEconomyDoubleRoom() {
		QueryWrapper<HotelRoomStatus> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("room_name", "经济双人间")
					.eq("room_status", 1);
		List<HotelRoomStatus> roomList = hotelBullingMapper.selectList(queryWrapper);
		return roomList;
	}
	@Override
	public List<HotelRoomStatus> findRoomByIds(List<Integer> roomids) {
		
		return hotelBullingMapper.selectBatchIds(roomids);
	}
}
