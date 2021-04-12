package com.kh.cm.ticket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.ticket.model.dao.TicketDao;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao ticketdao;
	
	public int saveTicket(Ticket ticket) {
		int result = 0;
		
		result = ticketdao.insertTicket(ticket);
		
		return result;
	}

}






































