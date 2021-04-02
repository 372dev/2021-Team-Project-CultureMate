package com.kh.cm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.member.model.service.MemberService;
import com.kh.cm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
		@Autowired
		private MemberService service;
		
		@RequestMapping("/login")
		public String login() {
			log.info("login() 메소드 호출");
			
			return "member/login";
		}
		
		@RequestMapping("member/enroll")
		public String enrollView() {
			log.info("회원가입 페이지 요청");
			
			return "member/enroll";
		}
		
		@RequestMapping(value = "member/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
			log.info(member.toString());
			
			int result = service.saveMember(member);
			
			log.info(member.toString());
			
			if(result > 0) {
				model.addObject("msg", "회원가입이 성공적으로 완료되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "회원가입에 실패하였습니다.");
				model.addObject("location", "member/enroll");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
}
