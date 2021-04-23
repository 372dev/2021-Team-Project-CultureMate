package com.kh.cm.member.controller;


import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.mate.model.service.MateService;
import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.member.model.dao.MemberDao;
import com.kh.cm.member.model.service.MemberService;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.mkshow.model.service.ShowReviewService;
import com.kh.cm.mkshow.model.vo.ShowReview;

import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.r;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
		@Autowired
		private MemberService service;
		

		@Autowired
		ShowReviewService showreview;
		
		@Autowired
		private MateService mateService;
		
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
			
			service.userAuth(userId, authkey);
			
			if(authkey == null) {
				model.addObject("msg", "인증키가 잘못되었습니다. 다시 인증해주세요.");
				model.addObject("location", "/");
			}
			
			if(userId == null) {
				model.addObject("msg", "잘못된 접근입니다. 다시 인증해주세요.");
				model.addObject("location", "/");
			}
			
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
				member.setId(loginMember.getId());
				member.setPassword(loginMember.getPassword());
				
				if(encoder.matches(password, loginMember.getPassword())) {
					result = service.updateMember(member, password);
				
					if(result > 0) {
//						model.addObject("loginMember", service.findMemberByUserId(loginMember.getUserId()));
						model.addObject("msg", "회원정보 수정을 완료했습니다.");
						model.addObject("location", "/member/myPage");
					} else {
						model.addObject("msg", "회원정보 수정에 실패했습니다.");
						model.addObject("location", "/member/myPage");
					}
				} else {
					model.addObject("msg", "비밀번호가 일치하지 않습니다.");
					model.addObject("location", "/member/myPage");
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
		@RequestMapping(value="/member/updatePwd", method = {RequestMethod.POST})
		public ModelAndView updatePwd(ModelAndView model, 
									@SessionAttribute(name="loginMember", required=false) Member loginMember, 
									@RequestParam("password") String password,
									@RequestParam("newpwd1") String password2) {
			int result = 0;
			
			log.info("로그인 멤버 패스워드 : " + encoder.encode(loginMember.getPassword()));
			log.info("현재 패스워드 : " + password);
			log.info("새로운 패스워드 : " + password2);
			
			if(encoder.matches(password, loginMember.getPassword())) {
				result = service.changePwd(loginMember.getUserId(), password2);
				
				if(result > 0) {
					model.addObject("msg", "비밀번호 수정을 완료했습니다.");
				} else {
					model.addObject("msg", "비밀번호 변경에 실패했습니다.");
				}
			} else {
				model.addObject("msg", "비밀번호가 일치하지 않습니다.");
			}
			
			model.addObject("location", "/member/updatePwd");
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 회원탈퇴 GET 요청
		@RequestMapping(value="/member/withdrawal", method = {RequestMethod.GET})
		public String withdrawlGet() {
			log.info("회원탈퇴 페이지 get 요청");
			
			return "member/withdrawal";
		}

		// 회원탈퇴
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
		
		// 내가 쓴 메이트/티켓나눔 글 조회페이지
		@RequestMapping(value="/member/myPosts", method = {RequestMethod.GET})
		public ModelAndView myPostsGet(ModelAndView model, Mate mate, Share share,
										@SessionAttribute(name="loginMember", required=false) Member loginMember,
										@RequestParam(value="page", required=false, defaultValue="1") int page,
										@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit) {
			
			log.info("내가 쓴 메이트/티켓나눔 글 페이지 get 요청");
			
			mate.setMateWriteId(loginMember.getId());
			share.setShareWriteId(loginMember.getId());
			
			// 상속해서 사용하는 편을 권장함.
			List<Collection> postList = null;
			
			int postCount = mateService.getMateCount();
			
			PageInfo pageInfo = new PageInfo(page, 10, postCount, listLimit);
			
			postList = mateService.getPostsByUserId(pageInfo, mate.getMateWriteId(), share.getShareWriteId());
			
			model.addObject("postList", postList);
			model.addObject("pageInfo", pageInfo);
			
			model.setViewName("member/myPosts");
			
			return model;
		}
		
		// 내가 쓴 리뷰 조회
		@RequestMapping(value="/member/myReviews", method = {RequestMethod.GET})
		public ModelAndView myReviewsGet(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				ModelAndView model) {
			log.info("내가 쓴 리뷰 글 페이지 get 요청");
			
			
			System.out.println("나의 아이디" + loginMember.getId());
			
			List<ShowReview> review = showreview.findMyRevuew(loginMember.getId());
			
			if(review.size() < 1) {
				System.out.println("작성된 리뷰 없음");
			}else {
				System.out.println("나의 리뷰 첫번쨰" + review.get(0).getMt20id());
				log.info("리부사이즈" + review.size());
				
			}
			
			model.addObject("review", review);
			model.setViewName("member/myReviews");
			
			return model;
		}
	
		// 아이디/비밀번호 찾기 GET 요청
		@RequestMapping(value="/member/findIdAndPwd", method = {RequestMethod.GET})
		public String findIdAndPwdGet() {
			log.info("아이디/비밀번호 찾기 페이지 get 요청");
			
			return "member/findIdAndPwd";
		}
		
		// 아이디 찾기
		@RequestMapping(value="/member/findId", method= {RequestMethod.POST})
		@ResponseBody
		public String findId(@RequestParam("inputName_1") String userName, @RequestParam("inputEmail_1") String email, 
							@RequestParam("inputPhone_1") String phone) {
			log.info(userName);
			String result = service.findId(userName, email, phone);
			log.info("controller 받은 후 : " + result);
			return result;
		}

		// 비밀번호 찾기
		@SuppressWarnings("unused")
		@RequestMapping(value="/member/findPassword", method = {RequestMethod.POST})
		@ResponseBody
		public ModelAndView findPassword(ModelAndView model, @ModelAttribute Member member,
				@RequestParam("inputId_1") String userId, @RequestParam("inputEmail_2") String email, 
				@RequestParam("inputPhone_2") String phone) throws Exception {
			
			member = memberDao.selectMember(userId);
			
			log.info(member.toString());
			
			if(member != null) {
				service.findPwd(userId, email, phone);
				model.addObject("msg", "임시 비밀번호가 이메일로 발송되었습니다. :)");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "등록하신 회원 정보가 없습니다. :<");
				model.addObject("location", "/member/findIdAndPwd");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		//관리자페이지 멤버전체조회
		@RequestMapping(value = "/admin/adminpage", method = {RequestMethod.GET})
		public ModelAndView memberAllList(ModelAndView model, 
				                          @SessionAttribute(name = "loginMember") Member loginMember,
				                          @RequestParam(value="page", required=false, defaultValue="1") int page,
				          				  @RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit) {
			
			   List<Member> list = null;
			   int memberCount  = service.memberAllCount();
			   
			   System.out.println(memberCount);
			   
			   PageInfo pageInfo = new PageInfo(page, 10, memberCount, listLimit);
			   
			   list = service.getMemberList(pageInfo);
			   
			    System.out.println(list);
			   model.addObject("memlist",list);
			   model.addObject("pageInfo", pageInfo);
			   model.setViewName("admin/adminpage");
			
			return model;
			
		}
		
		@RequestMapping(value = "/admin/list.do", method = {RequestMethod.POST})
		public ModelAndView memberAllSerch(
				@RequestParam(value="page", required=false, defaultValue="1") int page,
				@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit,
				@RequestParam String search, ModelAndView model,
				@RequestParam String keyword) {
			
            List<Member> memberList = null;
            int memberCount = service.memberSearchCount(search, keyword);
            
            System.out.println(memberCount);
            
            PageInfo pageInfo = new PageInfo(page, 10, memberCount, listLimit);
		
            pageInfo.setSearch(search);
    		pageInfo.setKeyword(keyword);
    		
    		memberList = service.memberSearchList(pageInfo);
    		
    		System.out.println(memberList);
    		System.out.println(search);
    		System.out.println(keyword);
    		
    		model.addObject("memlist", memberList);
    		model.addObject("pageInfo", pageInfo);
    		model.setViewName("/admin/adminpage");
    		
		return model;
		}
		
		// 관리자페이지에서 회원정보 상세조회
		@RequestMapping(value = "/admin/memupdate", method = {RequestMethod.GET})
		public ModelAndView adminUpdateMemberView(ModelAndView model,
				               @RequestParam("userId") String userId) {
			
			log.info("멤버조회" + userId);
			
	      Member  member = service.findMember(userId);
	      
	      log.info("멤버정보" + member);
	      	      
	       model.addObject("member", member);
	       model.setViewName("admin/memupdate");
	       
		   return model;
		
		}
		
		// 관리자페이지에서 회원정보수정
		@RequestMapping(value = "/admin/memupdate", method = {RequestMethod.POST})
		public ModelAndView adminUpdateMember(ModelAndView model, @RequestParam("userId") String userId,
				                         Member member) {
			
			int result = 0;
		
   				
		        	 result = service.adminupdateMember(member);
		        	 
		        	 if(result > 0) {
							model.addObject("msg", "회원정보 수정을 완료했습니다.");
							model.addObject("location", "/admin/adminpage");
						} else {
							model.addObject("msg", "회원정보 수정에 실패했습니다.");
							model.addObject("location", "/admin/memupdate");
						}

					

				model.setViewName("common/msg");
				
				return model;
		}

		
		// 관리자페이지에서 회원 탈퇴
		@RequestMapping(value = "/admin/delteMemebr", method = {RequestMethod.POST})
		public ModelAndView adminDelteMember(Member member, ModelAndView model,
				             @RequestParam("userId") String userId) {
			
			log.info("회원 아이디 불러쪄?? :" + userId);
			
			int result = 0;
			 			
			result = service.admindeleteMember(userId);
			log.info("불러쪄? :" + userId);
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/admin/adminpage");
			} else {
				model.addObject("msg", "회원탈퇴에 실패하였습니다.");
				model.addObject("location", "/admin/adminpage");
			}
			
	        model.setViewName("common/msg");
	        
			return model;
		}
		
}
