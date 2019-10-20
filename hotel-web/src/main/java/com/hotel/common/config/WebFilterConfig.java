package com.hotel.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 
 * 未登录状态下拦截访问订餐的人
 *
 */

@Configuration
public class WebFilterConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new UserAccessInterceptor()).addPathPatterns("/food/hotel_food");
	}
}
