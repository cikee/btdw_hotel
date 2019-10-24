package com.hotel.dubbo.service;

import java.util.List;

import com.hotel.pojo.TB_RoomType;

public interface RoomManageService {

	//起始的查询,写了个固定分页  0,4
	List<TB_RoomType> findRoomType();

	//插入
	void insertRoom(TB_RoomType room_type);

	int getRowCount();

	//分页查询
	List<TB_RoomType> findPageById(Integer pageCurrent);

	//删除
	int deleteRoom(String id);

	//更新操作 1.先根据id查询房间  数据回显
	TB_RoomType findRoom(String id);

	//更新操作 2.将传过来的数据进行更新操作
	int updateRoom(TB_RoomType room_type);


}
