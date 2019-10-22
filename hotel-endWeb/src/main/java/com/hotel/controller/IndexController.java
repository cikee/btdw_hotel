package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping("")
	public String index() {
		return "frame";
	}
	
	@RequestMapping("/frame")
	public String frame() {
		return "frame";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
}
