package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotelRoomDao;
import com.hotel.mapper.HotelRoomMapper;
import com.hotel.pojo.HotelRoom;


@Service //dubbo
public class HotelRoomDaoServiceImpl implements HotelRoomDao{

	@Autowired
	private HotelRoomMapper HotelRoomMapper;
	
	@Override
	public List<HotelRoom> findRoomByStoreId(Integer id) {
		List<HotelRoom> findRoomByStoreId = HotelRoomMapper.findRoomByStoreId(id);
		return findRoomByStoreId;
	}

	@Override
	public List<HotelRoom> findRoomToOrder(Integer id) {
		List<HotelRoom> findRoomToOrder = HotelRoomMapper.findRoomToOrder(id);
		return findRoomToOrder;
	}

}
