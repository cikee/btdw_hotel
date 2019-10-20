package com.hotel;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude=DataSourceAutoConfiguration.class) //忽略数据源连接
@MapperScan("com.hotel.mapper")
public class SpringBootRun {
	
	public static void main(String[] args) {
		//
		SpringApplication.run(SpringBootRun.class, args);
	}
}
