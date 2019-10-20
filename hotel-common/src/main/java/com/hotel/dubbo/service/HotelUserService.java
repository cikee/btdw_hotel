package com.hotel.dubbo.service;

import com.hotel.pojo.HotelUser;

public interface HotelUserService {

	HotelUser selectLoginByUsername(String userName,String userNewPwd,String userPwd);
	
	int saveUserObject(HotelUser hUser);
}
