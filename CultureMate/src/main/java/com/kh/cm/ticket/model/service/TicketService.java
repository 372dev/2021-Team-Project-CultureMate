package com.kh.cm.ticket.model.service;

import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.vo.Ticket;

public interface TicketService {

	int saveTicket(Ticket ticket);

	int countTicket(int id);

	int updateRank02(Member member);

	int updateRank03(Member member);

	Member findMemberById(int id);
	
	
	
	
	

}
