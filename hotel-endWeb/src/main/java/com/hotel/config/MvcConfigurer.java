package com.hotel.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //交给spring管理
public class MvcConfigurer implements WebMvcConfigurer{
	
	//开启匹配后缀型配置  html
	@Override
	public void configurePathMatch(PathMatchConfigurer configurer) {
		
		configurer.setUseSuffixPatternMatch(true);
	}
	
	//@Autowired
	//private UserInterceptre userInterceptre;
	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(userInterceptre)
//				.addPathPatterns("/cart/**","/order/**");
//	}
}
