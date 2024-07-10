package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {



	@Autowired
	HttpSession session;

	@RequestMapping("/home")
	public String index1(Model model) {
		return "index";
	}
	@RequestMapping("/menu")
	public String FormMenu() {
		return "menu";
	}
	@RequestMapping("/about")
	public String FormAbout() {
		return "about";
	}
	
	@RequestMapping("/book")
	public String FormBook() {
		return "book";
	}


}