package com.hotel.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hotel.dubbo.service.RoomStatusService;
import com.hotel.mapper.RoomStatusMapper;
import com.hotel.pojo.HotelRoomStatus;

@Service   //alibaba.dubbo
public class RoomStatusServiceImpl implements RoomStatusService{
	@Autowired
	private RoomStatusMapper roomStatusMapper;

	@Override
	public List<HotelRoomStatus> roomStatus() {
		
		return roomStatusMapper.selectList(null);

	}
	
	/**
	 * 查询房间号状态是否为空房 status状态码==1
	 */
	@Override
	public String getRoomNumber(Integer fjbh) {
		QueryWrapper<HotelRoomStatus> queryWrapper = 
				new QueryWrapper<HotelRoomStatus>();
		queryWrapper.eq("room_number", fjbh);
		HotelRoomStatus selectOne = roomStatusMapper.selectOne(queryWrapper);
				
		if(selectOne !=null && selectOne.getRoomStatus()==1) {
			return "<font color='#1E5807'>√ 房间检测正常，您可以开单!</font><input type='hidden' name='ok' value='1'>";
		}
		
		return "<font color='#f54a06'>× 当前房间不可开单!</font>";
		
	}

	/**
	 * 根据房间号查询当前所有字段信息
	 * fjkd fjkd2 controller需要用
	 * 
	 */
	@Override
	public HotelRoomStatus findByRoomNumber(HotelRoomStatus room) {
		QueryWrapper<HotelRoomStatus> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("room_number", room.getRoomNumber());
		return roomStatusMapper.selectOne(queryWrapper);
	}



}
