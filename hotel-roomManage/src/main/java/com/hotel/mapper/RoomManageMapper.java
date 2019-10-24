package com.hotel.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hotel.pojo.TB_RoomType;

public interface RoomManageMapper extends BaseMapper<TB_RoomType>{

	List<TB_RoomType> findPageById(Integer startIndex, Integer pageSize);
	
}
