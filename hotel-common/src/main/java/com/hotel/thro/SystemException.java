package com.hotel.thro;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.hotel.vo.SysResult;

import lombok.extern.slf4j.Slf4j;

@RestControllerAdvice //对controller层的异常生效
@Slf4j
public class SystemException{
	
	@ExceptionHandler(RuntimeException.class)//对运行时异常生效
	public SysResult exception(Throwable throwable) {
		throwable.printStackTrace();
		log.info(throwable.getMessage());
		return SysResult.fail();
	}

}
