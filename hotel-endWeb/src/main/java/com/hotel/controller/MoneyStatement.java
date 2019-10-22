package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Money/")
public class MoneyStatement {
@RequestMapping("statement")
public String showMoney() {
	
	return "Money/statement";
}

}
