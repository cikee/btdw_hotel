package com.hotel.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.hotel.dubbo.service.RoomManageService;
import com.hotel.mapper.RoomManageMapper;
import com.hotel.pojo.TB_RoomType;

@Service //dubbo
public class RoomManageServiceImpl implements RoomManageService{

	@Autowired
	private RoomManageMapper roomManageMapper;
	
	//查询所有房间
	@Override
	public List<TB_RoomType> findRoomType() {
		List<TB_RoomType> tb_roomType = roomManageMapper.findPageById(0,4);
		if(tb_roomType==null) {
		}
		return tb_roomType;
	}
	
	//查询总记录数
	@Override
	public int getRowCount() {
		Integer result = roomManageMapper.selectCount(null);
		return result;
	}

	@Override
	public void insertRoom(TB_RoomType room_type) {
		if(room_type.getRoomTypename()!=null&&room_type.getRoomPrice()!=null&&room_type.getRoomDeposit()!=null) {
			int result = roomManageMapper.insert(room_type);
			if(result==0) {
				throw new RuntimeException("增加房间失败!");
			}
		}else {
			throw new RuntimeException("插入的数据有为空项");
		}
	}

	//分页查询
	@Override
	public List<TB_RoomType> findPageById(Integer pageCurrent) {
		//1.验证当前页码值是否合法
		if(pageCurrent== null||pageCurrent<1)
		throw new IllegalArgumentException("当前页码值不正确");
		
		//3.查询当前页记录
		Integer pageSize=4;
		Integer startIndex=(pageCurrent-1)*pageSize;
		List<TB_RoomType> result = roomManageMapper.findPageById(startIndex,pageSize);
		System.out.println(result.size());
		return result;
	}

	
	//根据id删除房间
	@Override
	public int deleteRoom(String id) {
		int result = roomManageMapper.deleteById(id);
		return result;
	}

	
	//更新操作之前,根据id查询房间
	@Override
	public TB_RoomType findRoom(String id) {
		TB_RoomType result = roomManageMapper.selectById(id);
		if(result==null) {
			throw new RuntimeException("查询失败");
		}
		return result;
	}

	//更新房间 
	@Override
	public int updateRoom(TB_RoomType room_type) {
		UpdateWrapper<TB_RoomType> updateWrapper = new UpdateWrapper<>();
		updateWrapper.eq("id", room_type.getId());
		 int result = roomManageMapper.update(room_type, updateWrapper);
		if(result==0) {
			throw new RuntimeException("更新失败");
		}
		return result;
	}


}
