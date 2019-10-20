package com.hotel;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.hotel.dubbo.Daoservice.HotelRoomDao;
import com.hotel.dubbo.Daoservice.HotelStoreDao;
import com.hotel.pojo.HotelRoom;
import com.hotel.pojo.HotelStore;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HotelStoreTests {
	
	@Autowired
	private HotelStoreDao hotelStoreDao;
	@Autowired
	private HotelRoomDao hotelRoomDao;
	
	@Test
	public void findAllStore() {
		 List<HotelStore> result = hotelStoreDao.findAllStore();
		System.out.println(result);
	}
	
	@Test
	public void findRoom() {
		List<HotelRoom> result = hotelRoomDao.findRoomByStoreId(1);
		System.out.println(result);
	}
}
