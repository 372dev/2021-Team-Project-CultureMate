package com.kh.cm.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.member.model.dao.MemberDao;
import com.kh.cm.member.model.service.MemberService;
import com.kh.cm.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
		@Autowired
		private MemberService service;
		
		@Autowired
		MemberDao memberDao;

		@GetMapping("/login")
		public String loginView() {
			log.info("로그인 페이지 요청");
			
			return "member/login";
		}
		
		@RequestMapping(value = "member/login", method = {RequestMethod.POST})
		public ModelAndView login(ModelAndView model,
							@RequestParam("userId") String userId, @RequestParam("password") String password) {
			
			log.info("{},{}", userId, password);
			
			Member loginMember = service.login(userId, password);
			
			if(loginMember != null) {
				model.addObject("loginMember", loginMember);
				model.setViewName("redirect:/");
			} else {
				model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			}
			
			return model; // model에 이미 뷰를 갖고 있기 때문에 model을 리턴해주면 조건문에 따라서 보내준다.
		}
		
		@RequestMapping("/logout")
		public String logout(SessionStatus status) {
			
			status.setComplete();
			
			log.info("status.iscComplete" + status.isComplete());
			
			return "redirect:/";
		}
		
		@GetMapping("/enroll")
		public String enrollView() {
			log.info("회원가입 페이지 요청");
			
			return "member/enroll";
		}
		
		@RequestMapping(value="member/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
			
			int result = service.saveMember(member);
			
			log.info(member.toString());
			
			if(result > 0) {
				model.addObject("msg", "회원가입이 성공적으로 완료되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "회원가입에 실패하였습니다.");
				model.addObject("location", "/member/enroll");
			}
			
			model.setViewName("common/msg");
			
			return model;
			
//			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//			member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
//			memberDao.insertMember(member);
//			return "redirect:/";
		}
		
		@RequestMapping("/member/idCheck")
		@ResponseBody
		public Object idCheck(@RequestParam("userId") String userId) {
			log.info("User ID : {}", userId);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("validate", service.validate(userId));
			
			return map;
		}
		
		@RequestMapping("/member/delete")
		public ModelAndView deleteMember(ModelAndView model, @SessionAttribute(name="loginMember", required = false) Member loginMember, 
				@RequestParam("userId") String userId) {
		int result = 0;
		
		if(loginMember != null) {
			if(loginMember.getUserId().equals(userId)) {
				result = service.deleteMember(userId);
				
				if(result > 0) {
					model.addObject("msg", "정상적으로 탈퇴되었습니다.");
					model.addObject("location", "/");
				} else {
					model.addObject("msg", "회원가입에 실패하였습니다.");
					model.addObject("location", "/member/myPage");
				}
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/");
			} 
		} else {
			model.addObject("msg", "로그인 후 정보를 수정해주세요.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
		}
		
}
