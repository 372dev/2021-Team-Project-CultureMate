package com.kh.cm.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		@Autowired
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		

		@RequestMapping(value="login", method = {RequestMethod.GET})
		public String loginGET() {
			log.info("로그인 페이지 요청");
			
			return "member/login";
		}
		
		@RequestMapping(value = "member/login", method = {RequestMethod.POST})
		public ModelAndView login(ModelAndView model,
							@RequestParam("userId") String userId, @RequestParam("password") String password) {
			
			log.info("{},{}", userId, password);
			
			Member loginMember = service.login(userId, password);
			
			System.out.println("controller uerId : " + userId);
			System.out.println("controller password : " + password);
			System.out.println("controller loginMember : " + loginMember);
			
			if(loginMember != null) {
				model.addObject("loginMember", loginMember);
				model.setViewName("redirect:/");
			} else {
				model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
				model.addObject("location", "/login");
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
		
		@RequestMapping(value="enroll", method = {RequestMethod.GET})
		public String enrollGET() {
			log.info("회원가입 페이지 요청");
			
			return "member/enroll";
		}
		
		@RequestMapping(value="/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
			
			int result = service.saveMember(member);
			
			log.info(member.toString());
			
			if(result > 0) {
				model.addObject("msg", "회원가입이 성공적으로 완료되었습니다. 이메일 인증을 완료해주세요 :)");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "회원가입에 실패하였습니다.");
				model.addObject("location", "/member/enroll");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}

		// 이메일 인증키 확인
		@RequestMapping(value="/emailConfirm", method= {RequestMethod.GET})
		public String emailConfirm(@RequestParam("userId") String userId, @RequestParam("authkey") String authkey , ModelAndView model) {
//			Member member = memberDao.selectMember(userId);
//			member = service.userAuth(member);
			
			service.userAuth(userId, authkey);
			
			if(authkey == null) {
				model.addObject("msg", "인증키가 잘못되었습니다. 다시 인증해주세요.");
				model.addObject("location", "/");
			}
			
			if(userId == null) {
				model.addObject("msg", "잘못된 접근입니다. 다시 인증해주세요.");
				model.addObject("location", "/");
			}
			
//			model.addObject("member", member);
			model.setViewName("common/msg");
			
			return "/member/emailConfirm";
		}

		
		// 아이디 중복검사
		@RequestMapping(value = "/member/idCheck", method = {RequestMethod.GET})
		@ResponseBody // 추가 안해주면 enroll.jsp로 메소드의 결과 반환되지 않음
		public int validate(@RequestParam("userId") String userId) {
			
			return service.validate(userId);
		}
		
		// 마이페이지 요청
		@RequestMapping(value="/member/myPage", method = {RequestMethod.GET})
		public String myPageGet() {
			log.info("마이페이지 get 요청");
			
			return "member/myPage";
		}
		

		// 회원정보 수정
		@RequestMapping("/member/update")
		public ModelAndView updateMember(ModelAndView model, 
										@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
										@ModelAttribute Member member, @RequestParam("password") String password) {
			
			int result = 0;
			
			if(loginMember.getUserId().equals(member.getUserId())){
				log.info(loginMember.toString());
				log.info(member.toString());
				member.setId(loginMember.getId());
				member.setPassword(loginMember.getPassword());
				log.info("설정 후" + member.toString());
				
				if(encoder.matches(password, loginMember.getPassword())) {
					result = service.updateMember(member, password);
				
					if(result > 0) {
						model.addObject("loginMember", service.findMemberByUserId(loginMember.getUserId()));
						model.addObject("msg", "회원정보 수정을 완료했습니다.");
						model.addObject("location", "/member/myPage");
					} else {
						model.addObject("msg", "회원정보 수정에 실패했습니다.");
						model.addObject("location", "/member/myPage");
					}
				}
				
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 비밀번호 변경 페이지 요청
		@RequestMapping(value="/member/updatePwd", method = {RequestMethod.GET})
		public String updatePwdGet() {
			log.info("비밀번호 변경페이지 get 요청");
			
			return "member/updatePwd";
		}
		
		// 비밀번호 변경 메소드
		@RequestMapping(value="/member/updatePwd")
		public ModelAndView updatePwd(ModelAndView model, 
									@SessionAttribute(name="loginMember", required=false) Member loginMember, 
									@RequestParam("password") String password) {
			int result = 0;
			
			if(encoder.matches(password, loginMember.getPassword())) {
				result = service.changePwd(loginMember.getUserId(), password);
				
				if(result > 0) {
					model.addObject("msg", "비밀번호 수정을 완료했습니다.");
					model.addObject("location", "/member/updatePwd");
				} else {
					model.addObject("msg", "비밀번호 변경에 실패했습니다.");
					model.addObject("location", "/member/updatePwd");
				}
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 회원탈퇴 GET 요청
		@RequestMapping(value="/member/withdrawal", method = {RequestMethod.GET})
		public String withdrawl() {
			log.info("회원탈퇴 페이지 get 요청");
			
			return "member/withdrawal";
		}

		
		@RequestMapping("/member/delete")
		public ModelAndView deleteMember(ModelAndView model, 
										@SessionAttribute(name="loginMember", required = false) Member loginMember, 
										@RequestParam("userId") String userId, @RequestParam("password") String password) {
			int result = 0;
			log.info(password);
			log.info(loginMember.getPassword());
			
			if(loginMember.getUserId().equals(userId)) {
				if(encoder.matches(password, loginMember.getPassword())) {
					result = service.deleteMember(userId);
					
					if(result > 0) {
						model.addObject("msg", "정상적으로 탈퇴되었습니다.");
						model.addObject("location", "/");
					} else {
						model.addObject("msg", "회원가입에 실패하였습니다.");
						model.addObject("location", "/member/withdrawal");
					}
				} else {
					model.addObject("msg", "비밀번호가 동일하지 않습니다.");
					model.addObject("location", "/member/withdrawal");
				}
				
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/");
			} 
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 내가 쓴 메이트 글 조회
		@RequestMapping(value="/member/myPosts", method = {RequestMethod.GET})
		public String myPostsGet() {
			log.info("내가 쓴 메이트 글 페이지 get 요청");
			
			return "member/myPosts";
		}
		
		// 내가 쓴 리뷰 조회
		@RequestMapping(value="/member/myReviews", method = {RequestMethod.GET})
		public String myReviewsGet() {
			log.info("내가 쓴 리뷰 글 페이지 get 요청");
			
			return "member/myReviews";
		}
		
		// 아이디 찾기 GET 요청
		@RequestMapping(value="/member/findId", method = {RequestMethod.GET})
		public String findIdGet() {
			log.info("아이디 찾기 페이지 get 요청");
			
			return "member/findId";
		}
		
		@RequestMapping(value="/member/findId", method= {RequestMethod.POST})
		@ResponseBody
		public String findId(@ModelAttribute Member member, @RequestParam("userName") String userName, 
								@RequestParam("email") String email, @RequestParam("phone") String phone) {
			
			if(userName.equals(member.getUserName()) && email.equals(member.getEmail()) && phone.equals(member.getPhone())) {
//				service.findId(userName, email, phone);
//				String userId = "{\"userId\":\""
//				return 
			} else {
				
			}
			return phone;
			
		}
		
		// 비밀번호 찾기 GET 요청
		@RequestMapping(value="/member/findPassword", method = {RequestMethod.GET})
		public String findPasswordGet() {
			log.info("비밀번호 찾기 페이지 get 요청");
			
			return "member/findPassword";
		}
		
		//관리자페이지 멤버전체조회
		@RequestMapping(value = "/admin/adminpage", method = {RequestMethod.GET})
		public ModelAndView memberAllList(ModelAndView model, 
				                          @SessionAttribute(name = "loginMember") Member loginMember) {
			
			   List<Member> list = null;
			   int memberCount  = service.memberAllCount();
			   
			   System.out.println(memberCount);
			   
			   list = service.getMemberList();
			   
			   model.addObject("memlist",list);
			   model.setViewName("admin/adminpage");
			
			return model;
			
		}
		
		// 관리자페이지에서 회원정보 페이지뷰
		@RequestMapping(value = "/admin/memupdate", method = {RequestMethod.GET})
		public void adminUpdateMemView() {
			
		}
		
		@RequestMapping(value = "/admin/memupdate", method = {RequestMethod.POST})
		public ModelAndView adminUpdateMember(ModelAndView model,
				               @RequestParam("userId") String userId) {
			
			
	      Member  member = service.findMember(userId);
	      
	       model.addObject("mem", member);
	       model.setViewName("admin/adminpage");
	       
		return model;
		
		}	
		
}
