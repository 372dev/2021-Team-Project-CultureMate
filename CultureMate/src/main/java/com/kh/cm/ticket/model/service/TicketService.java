package com.kh.cm.ticket.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.member.model.vo.Member;
import com.kh.cm.ticket.model.vo.Ticket;

public interface TicketService {

	int saveTicket(Ticket ticket);

	int countTicket(int id);

	int updateRank02(int id);

	int updateRank03(int id);

	Member findMemberByUserId(String userId);

	int getTicketCount(int id);

	List<Ticket> getTicketList(PageInfo pageInfo, int id);

	int deleteTicket(int ticket_num);

	int updateRankDefault(int id);

	int showAllCount();
	
	List<Ticket> getTiketAllList(PageInfo pageInfo);

	int ticketSearchCount(String search, String keyword);

	List<Ticket> ticketSearchList(PageInfo pageInfo);
	
	void createQR(String ticketId, HttpServletRequest request);

	void sendTicket(Ticket ticket, String email);
}