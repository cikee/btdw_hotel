package com.hotel.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.alibaba.dubbo.config.annotation.Service;
import com.hotel.dubbo.service.HotelUserService;
import com.hotel.exception.ServiceException;
import com.hotel.mapper.HotelUserMapper;
import com.hotel.pojo.HotelUser;

@Service
public class HotelUserServiceImpl implements HotelUserService {
	@Autowired
	private HotelUserMapper hotelUserMapper;
	@ExceptionHandler
	@Override
	public HotelUser selectLoginByUsername(String userName,String userNewPwd,String userPwd) {
		HotelUser hotelUser = hotelUserMapper.selectLoginByUsername(userName);
		System.out.println(hotelUser);
		System.out.println(userNewPwd);
		if(hotelUser!=null) {
			throw new IllegalArgumentException("此用户名已被使用,换个别的吧");
		}
		if(!userPwd.equals(userNewPwd)) {
		
			throw new IllegalArgumentException("两次输入的密码不一致");
		}
		return hotelUser;
	}


@Override
public int saveUserObject(HotelUser entity)  {
	//1.参数校验
	if(entity==null)
		throw new ServiceException("保存对象不能为空");
	if(StringUtils.isEmpty(entity.getUserName()))
		throw new ServiceException("用户名不能为空");
	if(StringUtils.isEmpty(entity.getUserPwd())) {
		System.out.println("password"+entity.getUserPwd());
		throw new ServiceException("密码不能为空");
	}
		
	
	
	//2.保存用户自身信息
    //2.1对密码进行加密
//	String source=entity.getUserPwd();
//	String salt=UUID.randomUUID().toString();
//	SimpleHash sh=new SimpleHash(//Shiro框架
//			"MD5",//algorithmName 算法
//			 source,//原密码
//			 salt, //盐值
//			 1);//hashIterations表示加密次数
//	entity.setUserSalt(salt);
//	entity.setUserPwd(sh.toHex());
	HotelUser selectLoginByUsername = hotelUserMapper.selectLoginByUsername(entity.getUserName());
	if(selectLoginByUsername!=null) {
		throw new ServiceException("用户名已存在");
	}
	int rows=hotelUserMapper.saveUserObject(entity);
	return rows;

	
}

}
