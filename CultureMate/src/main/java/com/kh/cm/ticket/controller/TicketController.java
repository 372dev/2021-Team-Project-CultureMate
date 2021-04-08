package com.kh.cm.ticket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cm.ticket.model.service.TicketService;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {
	
	@Autowired
	private TicketService ticketservice;

//	@RequestMapping("ticket/ticketing")
//	public String ticketing() {
//
//		return "ticket/ticketing";
//	}
	
	@RequestMapping(value = "ticket/ticketing", method = {RequestMethod.POST} )
	public ModelAndView ticketing(HttpServletRequest request, ModelAndView model, 
			@RequestParam("ticket_num") int ticket_num, @RequestParam("mt20id") String mt20id, 
			@RequestParam("id") int id, @RequestParam("user_id") String user_id, 
			@RequestParam("pi_num") int pi_num, @RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") String ticket_seat) {
		
		model.setViewName("ticket/ticketing");
		model.addObject("ticket_num", ticket_num);
		model.addObject("mt20id", mt20id);
		model.addObject("id", id);
		model.addObject("user_id", user_id);
		model.addObject("pi_num", pi_num);
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
	
	// 여기까지 지우기
	@RequestMapping(value = "ticket/ticketing/success",  method = {RequestMethod.POST})
	public ModelAndView success(HttpServletRequest request, ModelAndView model, 
			@RequestParam("ticket_num") int ticket_num, @RequestParam("mt20id") String mt20id, 
			@RequestParam("id") int id, @RequestParam("user_id") String user_id, 
			@RequestParam("pi_num") int pi_num, @RequestParam("ticket_qty") int ticket_qty, 
			@RequestParam("pcseguidance") String pcseguidance, @RequestParam("ticket_seat") String ticket_seat) {
		
		model.setViewName("ticket/success");
		model.addObject("ticket_num", ticket_num);
		model.addObject("mt20id", mt20id);
		model.addObject("id", id);
		model.addObject("user_id", user_id);
		model.addObject("pi_num", pi_num);
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

































