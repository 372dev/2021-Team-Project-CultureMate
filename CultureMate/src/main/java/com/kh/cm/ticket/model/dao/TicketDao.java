package com.kh.cm.ticket.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.vo.Ticket;

public interface TicketDao {

	int insertTicket(Ticket ticket);

	int countTicket(int id);

	int updateRank02(int id);

	int updateRank03(int id);

	Member selectMember(@Param("userId") String userId);

	List<Ticket> selectTicketList(RowBounds rowBounds, int id);

	int deleteTicket(int ticket_num);

	int updateRankDefault(int id);
	
	
	
	
	
	
	
	
	
	
	
	
	
}







































