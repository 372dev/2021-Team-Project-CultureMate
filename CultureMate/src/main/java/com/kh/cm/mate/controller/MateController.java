package com.kh.cm.mate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.mate.model.vo.Mate;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mate")
public class MateController {
	
	
	@RequestMapping(value="/write", method = {RequestMethod.GET}) 
	public String mateWrite( ) {
		return "board/mate/mateWrite";
	}
	@RequestMapping(value="/update", method = {RequestMethod.GET}) 
	public String mateUpdate( ) {
		return "board/mate/mateUpdate";
	}
	@RequestMapping(value="/view", method = {RequestMethod.GET}) 
	public String mateView( ) {
		return "board/mate/mateView";
	}
	@RequestMapping(value="/list", method = {RequestMethod.GET}) 
	public String mateList( ) {
		return "board/mate/mateList";
	}
	
//	@RequestMapping(value="/update", method = {RequestMethod.POST}) 
//	public ModelAndView mateUpdate(@RequestParam("mateId") Mate mateId,ModelAndView model) {
//		
//		return model;
//	}
	
//	public ModelAndView mateView(ModelAndView model) {
//		return model;
//	}
}
