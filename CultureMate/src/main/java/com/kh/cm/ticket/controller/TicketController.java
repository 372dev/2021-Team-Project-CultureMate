package com.kh.cm.ticket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.service.TicketService;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	
	@Autowired
	private TicketService ticketservice;
	
	@RequestMapping("ticket/ticketing/seat")
	public String seat() {
		
		return "ticket/seat";
	}
	
	@RequestMapping(value = "ticket/ticketing", method = {RequestMethod.POST} )
	public ModelAndView ticketing(HttpServletRequest request, ModelAndView model, 
			@RequestParam("mt20id") String mt20id, @RequestParam("prfnm") String prfnm,   
			@RequestParam("id") int id, @RequestParam("user_id") String user_id, 
			@RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") List<String> ticket_seat) {
		
		model.setViewName("ticket/ticketing");
		model.addObject("mt20id", mt20id);
		model.addObject("prfnm", prfnm);
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
	public ModelAndView success(HttpServletRequest request, ModelAndView model, 
			@RequestParam("mt20id") String mt20id, @RequestParam("prfnm") String prfnm,   
			@RequestParam("id") int id, @RequestParam("user_id") String user_id, 
			@RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") List<String> ticket_seat) {
		
		model.setViewName("ticket/success");
		model.addObject("mt20id", mt20id);
		model.addObject("prfnm", prfnm);
		model.addObject("id", id);
		model.addObject("user_id", user_id);
		model.addObject("ticket_qty", ticket_qty);
		model.addObject("pcseguidance", pcseguidance);
		model.addObject("ticket_seat", ticket_seat);
		
		System.out.println("controller_success_model : " + model);
		
		return model;
	}

	@RequestMapping(value = "ticket/ticketing/fail", method = {RequestMethod.GET})
	public ModelAndView fail(HttpServletRequest request, ModelAndView model) {
		
		
		model.setViewName("ticket/fail");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

































