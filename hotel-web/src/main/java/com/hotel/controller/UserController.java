package com.hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.hotel.dubbo.Daoservice.HotelUserDao;
import com.hotel.dubbo.service.HotelUserService;
import com.hotel.pojo.HotelUser;
import com.hotel.vo.JsonResult;
import com.hotel.vo.User;

@Controller
@RequestMapping("/user/")
public class UserController {
	@Reference(check=false)
	HotelUserService hotelUserService;
	@Reference(check=false)
	HotelUserDao hotelUserDao;

	//	@RequestMapping("{UI}")
	//	public String UI(@PathVariable String UI) {
	//		return   UI;
	//	}

	@RequestMapping("doregister")
	@ResponseBody
	public JsonResult doregister(HotelUser hUser,Model model,String userNewPwd) {
		System.out.println(hUser);
		String userPwd=hUser.getUserPwd();
		hotelUserService.selectLoginByUsername(hUser.getUserName(),userNewPwd,userPwd);

		hotelUserService.saveUserObject(hUser);

		return new JsonResult("注册成功");
	}

	@RequestMapping("doLogin")
	@ResponseBody
	public JsonResult doLogin(String username,String password,HttpSession session) {
		//1.封装用户信息
		//		System.out.println(username);
		//		System.out.println(password);
		User result = hotelUserDao.findUser(username, password);
		//		System.out.println(result);
		if(result.equals(null)) {
			return new JsonResult("用户未注册");
		}
		//		Cookie cookie = new Cookie("username",username);
		//		response.addCookie(cookie);
		session.setAttribute("username", username);

		//		System.out.println(session);

		//		 UsernamePasswordToken token=new UsernamePasswordToken();
		//		 token.setUsername(username);
		//		 token.setPassword(password.toCharArray());
		//		 //2.提交用户信息(借助Subject对象)
		//		 //获取Subject对象
		//		 Subject subject=SecurityUtils.getSubject();
		//		 //提交用户信息进行认证
		//		 subject.login(token);

		return new JsonResult("登录成功");
	}

	@RequestMapping("Access")
	public String Access() {
		return "loading";
	}
}
