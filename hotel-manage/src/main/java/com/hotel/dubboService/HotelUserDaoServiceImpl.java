package com.hotel.dubboService;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.Daoservice.HotelUserDao;
import com.hotel.mapper.HotelUserMapper;
import com.hotel.pojo.HotelUser;
import com.hotel.vo.HotelUserVo;
import com.hotel.vo.User;


@Service //dubbo
public class HotelUserDaoServiceImpl implements HotelUserDao{

	@Autowired
	private HotelUserMapper hotelUserMapper;
	
	@Override
	public HotelUser selectLoginByUsername(String userName) {
		HotelUser selectLoginByUsername = hotelUserMapper.selectLoginByUsername(userName);
		return selectLoginByUsername;
	}

	@Override
	public int saveUserObject(HotelUser hUser) {
		int saveUserObject = hotelUserMapper.saveUserObject(hUser);
		return saveUserObject;
	}

	@Override
	public User findUser(String username, String userpwd) {
		User findUser = hotelUserMapper.findUser(username, userpwd);
		return findUser;
	}

	@Override
	public HotelUserVo findUserInfo(String username) {
		HotelUserVo findUserInfo = hotelUserMapper.findUserInfo(username);
		return findUserInfo;
	}

	@Override
	public int updateUserInfo(HotelUserVo user) {
		int updateUserInfo = hotelUserMapper.updateUserInfo(user);
		return updateUserInfo;
	}


}
