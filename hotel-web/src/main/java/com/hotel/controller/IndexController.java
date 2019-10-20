package com.hotel.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/")
public class IndexController {
	//默认首页
	@RequestMapping("")
	public String Index() {
		return "index";
	}

	@RequestMapping("{UI}")
	public String UI(@PathVariable String UI) {
		return UI;
	}

	@RequestMapping("doPageUI1")
	public String doPageUI1() {
		return "myorder";
	}
	 /**返回分页对应的页面*/
	  @RequestMapping("doPageUI")
	  public String doPageUI() {
		  return "pages/commonpage";
	  }
	  
	@RequestMapping("loading")
	public String removeSession(HttpSession session) {
		session.removeAttribute("username");
		return "loading";
	}

}
