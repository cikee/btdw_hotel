package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PageController {

	@RequestMapping("")
	public String indexPage() {
		return "frame";
	}
	
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/tgls/{UI}")
	public String tglsIndex(@PathVariable String UI) {
		return "tgls/"+UI;
	}
	
	@RequestMapping("/tgls/agent/{UI}")
	public String tglsAgent(@PathVariable String UI) {
		return "tgls/agent/"+UI;
	}
	
}
