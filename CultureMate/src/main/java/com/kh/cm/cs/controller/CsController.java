package com.kh.cm.cs.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.cs.model.vo.CsBoard;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/csboard")
public class CsController {

	@RequestMapping(value = "/help/csmain", method = {RequestMethod.GET})
	public void cslist() {
		
}


		@RequestMapping(value = "/help/csfaq", method = {RequestMethod.GET})
		public void csfaq() {
			
	}
		
		@RequestMapping(value = "/help/questionlist", method = {RequestMethod.GET})
		public void csQuestlist() {
			
	}
		
		@RequestMapping(value = "/help/qnacontent", method = {RequestMethod.GET})
		public void cscontent() {
			
	}
		@RequestMapping(value = "/help/notice", method = {RequestMethod.GET})
		public void csnotice() {
			
	}
		@RequestMapping(value = "/help/cswrite", method = {RequestMethod.GET})
		public void cswriteView() {
			
       
		}	
		
//		@RequestMapping(value = "/help/cswrite", method = {RequestMethod.POST})
//		public ModelAndView cswrite(
//				@SessionAttribute(name = "loginMember", required = false)
//				HttpServletRequest request, CsBoard csboard,
//				@RequestParam("upfile")MultipartFile upfile, ModelAndView model ) {
//			
//		}
}
				


		
	
