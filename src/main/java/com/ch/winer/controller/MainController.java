package com.ch.winer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {
	@RequestMapping("home")
	public String home( Model model) {
		model.addAttribute("pageName", "home");
		return "main";
	}
	@RequestMapping("introduce")
	public String introduce(Model model) {
		model.addAttribute("pageName", "introduce");
		return "introduce";
	}
}