package com.hotel.dubboService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotelFoodDao;
import com.hotel.mapper.HotelFoodMapper;
import com.hotel.pojo.HotelFood;

@Service //dubbo
public class HotelFoodDaoServiceImpl implements HotelFoodDao{

	@Autowired
	private HotelFoodMapper hotelFoodMapper;
	
	@Override
	public List<HotelFood> selectObjectByMuneId(int menuId) {
		List<HotelFood> selectObjectByMuneId = hotelFoodMapper.selectObjectByMuneId(menuId);
		return selectObjectByMuneId;
	}

	@Override
	public List<HotelFood> selectObjectByFoodId(int... id) {
		List<HotelFood> selectObjectByFoodId = hotelFoodMapper.selectObjectByFoodId(id);
		return selectObjectByFoodId;
	}


}
