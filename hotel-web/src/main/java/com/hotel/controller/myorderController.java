package com.hotel.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/pages/")
public class myorderController {
	@RequestMapping("home")
	public String Index() {
		return "pages/home";
	}
	@RequestMapping("order")
	public String Indexx() {
		return "pages/order";
	}
	@RequestMapping("basicinfo")
	public String Indexxx() {
		return "pages/basicinfo";
	}
	@RequestMapping("basicinfoedit")
	public String Indexxxx() {
		return "pages/basicinfoedit";
	}
	@RequestMapping("lunch")
	public String Indexxxxx() {
		return "pages/lunch";
	}
	
}
