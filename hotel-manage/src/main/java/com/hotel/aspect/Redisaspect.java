package com.hotel.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.hotel.annotation.Cache_Find;
import com.hotel.util.ObjectMapperUtil;

import redis.clients.jedis.JedisCluster;

@Component
@Aspect
public class Redisaspect {
   @Autowired
   private JedisCluster jedis;
   @Around("@annotation(CRedis)")
   public Object arround(ProceedingJoinPoint jp,Cache_Find CRedis) {
	   //1.获取key
	   String key=getkey(jp,CRedis);
	   //2.基于key去查redis缓存
	   String result = jedis.get(key);
	   Object data = null;
	   try {
		if (StringUtils.isEmpty(result)) {
			 
				data = jp.proceed();
			
			 String value=ObjectMapperUtil.toJSON(data);
			 if (CRedis.seconds()==0) {
				jedis.set(key, value);
			}else {
				jedis.setex(key, CRedis.seconds(), value);
			}
		}else {
			System.out.println("查缓存");
			Class returnType=getclass(jp);
			data=ObjectMapperUtil.toObject(result, returnType);
		}
		} catch (Throwable e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	System.out.println(data);
	   //3.把redis缓存中的json串转化为对象返回
	   return data;
   }
private Class getclass(ProceedingJoinPoint jp) {
	MethodSignature signature = (MethodSignature) jp.getSignature();
	return signature.getReturnType();
}
private String getkey(ProceedingJoinPoint jp, Cache_Find cRedis) {
	String key =cRedis.key();
	//1.用户自己定义了key直接获取
	if (!StringUtils.isEmpty(key)) {
		return key;
	}
	//2.用户无定义则自动生成
	/**
	 * 步骤:
	 * 	1.动态生成key  包名.类名.方法名::parentId
	 *  2.通过key查询redis缓存
	 */
	else {
		String classname=jp.getSignature().getDeclaringTypeName();
		String methodname=jp.getSignature().getName();
		Object[] args = jp.getArgs();
		key=classname+"."+methodname+"::"+args[0];
		return key;
	}
	
}
}
