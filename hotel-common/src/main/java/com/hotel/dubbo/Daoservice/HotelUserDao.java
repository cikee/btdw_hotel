package com.hotel.dubbo.Daoservice;


import com.hotel.pojo.HotelUser;
import com.hotel.vo.HotelUserVo;
import com.hotel.vo.User;

public interface HotelUserDao {

	//注册之前先判断数据库有没有此用户名
 HotelUser selectLoginByUsername(String userName);
 
 //注册功能保存用户到数据库
 int saveUserObject(HotelUser hUser);
	
 //登录功能查询数据库用户
 User findUser(String username,String userpwd);
 
 //达达
HotelUserVo findUserInfo(String username);
int updateUserInfo(HotelUserVo user);
}
