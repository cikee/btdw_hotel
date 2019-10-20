package com.hotel.util;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * json转化通用工具类
 */
public class ObjectMapperUtil {
	public static final ObjectMapper Mapper=new ObjectMapper();
	
	//对象转化为json的方法
	public static String toJSON(Object target) {
		String result=null;
		try {
			result = Mapper.writeValueAsString(target);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return result;
	}
	
	//json转化为对象的方法
	public static <T> T toObject(String json,Class<T> targetClass) {
			T object=null;
		try {
			object = Mapper.readValue(json, targetClass);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return object;
	}
}
