package com.kh.cm.evnet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EventController {

	@RequestMapping(value="/event", method = {RequestMethod.GET}) 
	public String eventView( ) {
		return "event/event";
	}
	@RequestMapping(value="/showBegginner", method = {RequestMethod.GET}) 
	public String eventView1() {
		return "event/showBegginner";
	}
}
