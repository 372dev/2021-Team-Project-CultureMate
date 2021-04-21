package com.kh.cm.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminControllter {

	
	@RequestMapping(value = "/showbook", method = {RequestMethod.GET})
	public void showbookList() {
		
	}
	
}

