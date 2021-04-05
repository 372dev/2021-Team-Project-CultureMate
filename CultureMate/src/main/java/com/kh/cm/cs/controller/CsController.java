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


		@RequestMapping(value = "/cscenter/csfaq", method = {RequestMethod.GET})
		public void csfaq() {
			
	}
		
		@RequestMapping(value = "/cscenter/questionlist", method = {RequestMethod.GET})
		public void csQuestlist() {
			
	}
		
		@RequestMapping(value = "/cscenter/qnacontent", method = {RequestMethod.GET})
		public void cscontent() {
			
	}
		@RequestMapping(value = "/cscenter/notice", method = {RequestMethod.GET})
		public void csnotice() {
			
	}

}
		
	
