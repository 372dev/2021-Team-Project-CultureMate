package com.kh.cm.ticket.model.dao;

import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.vo.Ticket;

public interface TicketDao {

	int insertTicket(Ticket ticket);

	int countTicket(int id);

	int updateRank02(Member member);

	int updateRank03(Member member);

	Member selectMember(int Id);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}







































