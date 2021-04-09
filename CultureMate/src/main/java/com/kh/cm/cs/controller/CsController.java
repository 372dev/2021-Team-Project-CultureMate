package com.kh.cm.cs.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.cs.model.service.CsBoardService;
import com.kh.cm.cs.model.vo.CsBoard;
import com.kh.cm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/help")
public class CsController {
	@Autowired
	private CsBoardService service; 
	
	@RequestMapping(value = "/csmain", method = {RequestMethod.GET})
	public void cslist() {
		
}


		@RequestMapping(value = "/csfaq", method = {RequestMethod.GET})
		public void csfaq() {
			
	}
		
		@RequestMapping(value = "/questionlist", method = {RequestMethod.GET})
		public void csQuestlist() {
			
	}
		
		@RequestMapping(value = "/qnacontent", method = {RequestMethod.GET})
		public void cscontent() {
			
	}
		@RequestMapping(value = "/notice", method = {RequestMethod.GET})
		public void csnotice() {
			
	}
		@RequestMapping(value = "/cswrite", method = {RequestMethod.GET})
		public void cswriteView() {
			
       
		}	
		
		@RequestMapping(value = "/cswrite", method = {RequestMethod.POST})
		public ModelAndView cswrite(
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				CsBoard csboard, ModelAndView model ) {
			
			System.out.println(csboard);
			
			int result = 0;
			
			if(loginMember.getUserId().equals(csboard.getId())) {
				csboard.setCsWriteNo(loginMember.getId());
				
			}else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("loaction", "/");
			}
			
	         result = service.saveCsBoard(csboard);
 		
 		     model.setViewName("common/msg");
 		
 		return model;
		}
				
}
		


		
	
