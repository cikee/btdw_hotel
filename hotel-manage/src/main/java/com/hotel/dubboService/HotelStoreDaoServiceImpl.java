package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotelStoreDao;
import com.hotel.mapper.HotelStoreMapper;
import com.hotel.pojo.HotelStore;


@Service //dubbo
public class HotelStoreDaoServiceImpl implements HotelStoreDao{

	@Autowired
	private HotelStoreMapper hotelStoreMapper;
	
	@Override
	public List<HotelStore> findAllStore() {
		List<HotelStore> findAllStore = hotelStoreMapper.findAllStore();
		return findAllStore;
	}

	@Override
	public int getRowCount() {
		int rowCount = hotelStoreMapper.getRowCount();
		return rowCount;
	}


}
