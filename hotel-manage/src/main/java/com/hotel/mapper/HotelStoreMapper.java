package com.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hotel.pojo.HotelStore;

public interface HotelStoreMapper{
	//查询数据库中的所有酒店店铺信息
	List<HotelStore> findAllStore();
	//查询总店铺数
	@Select("select count(*) from hotel_store")
	int getRowCount();
}
