package com.kh.cm.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.mkshow.model.service.ShowReviewService;
import com.kh.cm.ticket.model.service.TicketService;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	
	@Autowired
	private TicketService ticketservice;
	
	@Autowired
	private ShowReviewService showreviewservice;
	
	@RequestMapping("ticket/ticketing/seat")
	public String seat() {
		
		return "ticket/seat";
	}
	
	@RequestMapping(value = "ticket/ticketing", method = {RequestMethod.POST} )
	public ModelAndView ticketing(HttpServletRequest request, ModelAndView model, 
			@RequestParam("mt20id") String mt20id, @RequestParam("prfnm") String prfnm, 
			@RequestParam("ticket_date") String ticket_date, @RequestParam("id") int id, 
			@RequestParam("user_id") String user_id, @RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") List<String> ticket_seat) {
		
		model.setViewName("ticket/ticketing");
		model.addObject("mt20id", mt20id);
		model.addObject("prfnm", prfnm);
		model.addObject("ticket_date", ticket_date);
		model.addObject("id", id);
		model.addObject("user_id", user_id);
		model.addObject("ticket_qty", ticket_qty);
		model.addObject("pcseguidance", pcseguidance);
		model.addObject("ticket_seat", ticket_seat);
		
		System.out.println("controller_ticketing_model : " + model);
		
		return model;
	}
	
	@RequestMapping(value = "ticket/ticketing/success", method = {RequestMethod.GET})
	public String success() {

		return "ticket/success";
	}
	
	@RequestMapping(value = "ticket/ticketing/success",  method = {RequestMethod.POST})
	public ModelAndView success(HttpServletRequest request, ModelAndView model, Ticket ticket, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Member member, 
			@RequestParam("mt20id") String mt20id, @RequestParam("prfnm") String prfnm, 
			@RequestParam("ticket_date") String ticket_date, @RequestParam("id") int id, 
			@RequestParam("user_id") String user_id, @RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") List<String> ticket_seat) {
		
		// 여기까지 지우기
		System.out.println("controller_success loginMember : " + loginMember);
		System.out.println("controller_success member : " + member);
		
		ticket.setMt20id(mt20id);
		ticket.setPrfnm(prfnm);
		ticket.setTicket_date(ticket_date);
		ticket.setId(id);
		ticket.setUser_id(user_id);
		ticket.setTicket_qty(ticket_qty);
		ticket.setPcseguidance(pcseguidance);
		ticket.setTicket_seat(String.join(",", ticket_seat));
		
		int result = ticketservice.saveTicket(ticket);
		
		
		if(result > 0) {
			int count = ticketservice.countTicket(id);
			System.out.println("ticket : " + ticket);
			System.out.println("count : " + count);
			
			if(count > 4 && count < 10) {
				
				int updateRank = ticketservice.updateRank02(loginMember.getId());
				
			} else if(count > 9) {
				
				int updateRank = ticketservice.updateRank03(loginMember.getId());
			}
			
			System.out.println("controller_success_member : " + member);
			
			model.setViewName("ticket/success");
			model.addObject("mt20id", mt20id);
			model.addObject("prfnm", prfnm);
			model.addObject("ticket_date", ticket_date);
			model.addObject("id", id);
			model.addObject("user_id", user_id);
			model.addObject("ticket_qty", ticket_qty);
			model.addObject("pcseguidance", pcseguidance);
			model.addObject("ticket_seat", ticket_seat);
			model.addObject("loginMember", ticketservice.findMemberByUserId(loginMember.getUserId()));
			
			System.out.println("member : " + member);
			
			int ticket_num = ticket.getTicket_num();
			model.addObject("ticket_num", ticket_num);
			
		} else {
			model.addObject("msg", "결제가 정상적으로 이루어지지 않았습니다.");
			model.addObject("location", "${path}/ticket/ticketing/fail");
		}
		
		System.out.println("controller_success_model : " + model);
		showreviewservice.setreserve(ticket);
		return model;
	}

	@RequestMapping(value = "ticket/ticketing/fail", method = {RequestMethod.GET})
	public String fail() {
		
		return "ticket/fail";
	}
	
	@RequestMapping(value = "ticket/ticketing/fail",  method = {RequestMethod.POST})
	public ModelAndView fail(HttpServletRequest request, ModelAndView model, 
			@RequestParam("mt20id") String mt20id) {
		
		model.setViewName("ticket/fail");
		model.addObject("mt20id", mt20id);
		
		System.out.println("controller_fail_model : " + model);
		
		return model;
	}
	
	@RequestMapping(value = "member/ticket", method = {RequestMethod.GET})
	public ModelAndView mypage_ticket(ModelAndView model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		
		List<Ticket> list = null;
		int ticketCount = ticketservice.getTicketCount(loginMember.getId());		
		PageInfo pageInfo = new PageInfo(page, 10, ticketCount, listLimit);
		
		System.out.println(ticketCount);
		
		list = ticketservice.getTicketList(pageInfo, loginMember.getId());
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("ticket/list");
		
		System.out.println("list : " + list);
		
		return model;
	}
	
	@RequestMapping(value = "member/ticket/cancel", method = {RequestMethod.POST})
	public ModelAndView cancel(ModelAndView model, @RequestParam("ticket_num") int ticket_num, 
			@RequestParam("ticket_mt20id") String mt20id, 
			@RequestParam("ticket_id") int id, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Member member) {
		
		int result = ticketservice.deleteTicket(ticket_num);
		
		System.out.println(result);
		
		if(result > 0) {
			
			int count = ticketservice.countTicket(loginMember.getId());
			
			System.out.println("count : " + count);
			
			System.out.println("cancel member : " + member);
			
			if(count > 4 && count < 10) {
				
				int updateRank = ticketservice.updateRank02(loginMember.getId());
				
			} else if(count > 9) {
				
				int updateRank = ticketservice.updateRank03(loginMember.getId());
			} else {
				
				int updateRank = ticketservice.updateRankDefault(loginMember.getId());
			}
			
			model.addObject("loginMember", ticketservice.findMemberByUserId(loginMember.getUserId()));
			model.addObject("msg", "예매 취소를 완료했습니다.");
			model.addObject("location", "/member/ticket");
			model.setViewName("common/msg");
			
		} else {
			model.addObject("msg", "예매 취소를 실패했습니다.");
			model.addObject("location", "/member/ticket");
			model.setViewName("common/msg");
			
		}
		
		System.out.println("cancel loginMember : " + loginMember);
		
		Ticket ticket = new Ticket();
		ticket.setMt20id(mt20id);
		ticket.setId(id);
		showreviewservice.resetreserve(ticket);
		return model;
	}
	

	// 관리자 페이지 예약된 공연리스트 불러오기
	@RequestMapping(value = "/admin/showbook", method = {RequestMethod.GET})
	public ModelAndView showbookList(ModelAndView model, Ticket ticket,
			       @RequestParam(value="page", required=false, defaultValue="1") int page,
			       @RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit	) {
		
		List<Ticket> list = null;
		int showCount = ticketservice.showAllCount();
		
		System.out.println(showCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, showCount, listLimit);
		
		list =  ticketservice.getTiketAllList(pageInfo);
		
		System.out.println(list);
		
		model.addObject("ticketList", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("admin/showbook");
		
		return model;
	}
	
	//관리자페이지에서 검색 조회
	@RequestMapping(value = "/admin/showList", method = {RequestMethod.POST})
	public ModelAndView ticketAllSerch(
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="listlimit", required=false, defaultValue="10") int listLimit,
			@RequestParam String search, ModelAndView model,
			@RequestParam String keyword) {
		
		List<Ticket> ticketList = null;
        int ticketCount = ticketservice.ticketSearchCount(search, keyword);
        
        System.out.println(ticketCount);
        
        PageInfo pageInfo = new PageInfo(page, 10, ticketCount, listLimit);
	
        pageInfo.setSearch(search);
		pageInfo.setKeyword(keyword);
		
		ticketList = ticketservice.ticketSearchList(pageInfo);
		
		System.out.println(ticketList);
		System.out.println(search);
		System.out.println(keyword);
		
		model.addObject("ticketList", ticketList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/admin/showbook");
		
		return model;
		
	}
	
	// 관리자페이지에서 공연취소하기
	@RequestMapping(value = "/admin/ticketcancel", method = {RequestMethod.POST})
	public ModelAndView ticketcancel(ModelAndView model, @RequestParam("ticket_num") int ticket_num, 
			                           @ModelAttribute Member member) {
		
		int result = ticketservice.deleteTicket(ticket_num);
		
		System.out.println(result);
		
		if(result > 0) {
			
			int count = ticketservice.countTicket(member.getId());
			
			System.out.println("count : " + count);
			
			System.out.println("cancel member : " + member);
			
			if(count > 4 && count < 10) {
				
				int updateRank = ticketservice.updateRank02(member.getId());
				
			} else if(count > 9) {
				
				int updateRank = ticketservice.updateRank03(member.getId());
			} else {
				
				int updateRank = ticketservice.updateRankDefault(member.getId());
			}
			
			model.addObject("loginMember", ticketservice.findMemberByUserId(member.getUserId()));
			model.addObject("msg", "예매 취소를 완료했습니다.");
			model.addObject("location", "/admin/showbook");
			model.setViewName("common/msg");
			
		} else {
			model.addObject("msg", "예매 취소를 실패했습니다.");
			model.addObject("location", "/member/ticket");
			model.setViewName("common/msg");
			
		}
		
		System.out.println("cancel loginMember : " + member);
		
		return model;
	}
	
	@RequestMapping("ServiceIntro")
	public String ServiceIntro() {
		
		return "ticket/ServiceIntro";
	}
	
	@RequestMapping("TeamIntro")
	public String TeamIntro() {
		
		return "ticket/TeamIntro";

	}
	
}



















