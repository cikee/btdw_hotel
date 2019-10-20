package com.hotel.common.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAccessInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("username");
		if(name==null) {
			//点击订餐,未登录状态跳转至指定url
			response.sendRedirect("../loading");
		return false;	
		}
		return true;
		
	}
}
