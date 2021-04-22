package com.kh.cm.ticket.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;
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

	@Override
	public int countTicket(int id) {
	
		int result = ticketdao.countTicket(id);
		
		return result;
	}

	@Override
	public int updateRank02(int id) {
		int result = ticketdao.updateRank02(id);
		
		return result;
	}

	@Override
	public int updateRank03(int id) {
		int result = ticketdao.updateRank03(id);
		
		return result;
	}

	@Override
	public Member findMemberByUserId(String userId) {
		
		return ticketdao.selectMember(userId);
	}

	@Override
	public int getTicketCount(int id) {
		
		return ticketdao.countTicket(id);
	}

	@Override
	public List<Ticket> getTicketList(PageInfo pageInfo, int id) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return ticketdao.selectTicketList(rowBounds, id);
	}

	@Override
	public int deleteTicket(int ticket_num) {
		int result = ticketdao.deleteTicket(ticket_num);
		
		return result;
	}

	@Override
	public int updateRankDefault(int id) {
		int result = ticketdao.updateRankDefault(id);
		
		return result;
	}

	@Override
	public int showAllCount() {
		
		return ticketdao.showCount();
	}

	@Override
	public List<Ticket> getTiketAllList() {
		
		return ticketdao.showAllList();
	}
	
	
	
	
	
}






































