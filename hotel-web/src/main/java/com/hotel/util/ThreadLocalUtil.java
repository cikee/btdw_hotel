package com.hotel.util;

import com.hotel.pojo.HotelUser;

public class ThreadLocalUtil {

	private static ThreadLocal<HotelUser> thread=new ThreadLocal<>();
	//这里设置了user到theadLocal中后,直接调用get,remove就是删除这个user
	public static void set(HotelUser user) {
		thread.set(user);
	}
	
	public static HotelUser get() {
		
		return thread.get();
	}
	
	//防止内存泄露
	//此线程 如果调用多个线程可能产生内存泄露
	public static void remove() {
		thread.remove();
	}
}
