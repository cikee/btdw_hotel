package com.hotel.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public static String getCookieValue(HttpServletRequest request,String cookieName) {
		Cookie[] cookies = request.getCookies();
		if(cookies==null||cookies.length==0) {
			//没有cookie,返回null
			return null;
		}
		String value=null;
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals(cookieName)) {
				value=cookie.getValue();
				break;
			}
		}
		return value;
	}
}
