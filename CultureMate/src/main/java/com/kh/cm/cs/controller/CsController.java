package com.kh.cm.cs.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class CsController {

	@RequestMapping(value = "/cscenter/list", method = {RequestMethod.GET})
	public void cslist() {
		
}

}
		
	
