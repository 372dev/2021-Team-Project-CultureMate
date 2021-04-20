package com.kh.cm.mkshow.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.mkshow.model.dao.ShowReviewDao;
import com.kh.cm.mkshow.model.vo.ShowReview;
import com.kh.cm.ticket.model.vo.Ticket;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ShowReviewServiceImpl implements ShowReviewService {

	@Autowired
	private ShowReviewDao showDao;
	
	@Override
	public List<ShowReview> getReviewList(String mt20id) {
		// TODO Auto-generated method stub
		
		return showDao.selectReviewList(mt20id);
	}

	@Override
	public int saveReview(ShowReview review) {
		// TODO Auto-generated method stub
		String type = showDao.getreserve(review);
		log.info(type);
		review.setReserve(type);
		return showDao.saveReview(review);
	}

	@Override
	public int delReview(int no) {
		// TODO Auto-generated method stub
		return showDao.delReview(no);
	}

	@Override
	public List<ShowReview> findReviewWriter(int no) {

		return showDao.findUserNick(no);
	}

	@Override
	public int updateReview(ShowReview review) {
		// TODO Auto-generated method stub
	
		return showDao.updateReview(review);
		
	}

	@Override
	public int countReview(String mt20id) {
		// TODO Auto-generated method stub
		return showDao.countReview(mt20id);
	}
	
	@Override
	public int setreserve(Ticket ticket) {

		log.info(ticket.getMt20id());
		System.out.println("티켓아이디 : " + ticket.getId());
		
		String a = ticket.getMt20id();
		
		return showDao.setreserve(ticket);
		
	}

	@Override
	public void resetreserve(Ticket ticket) {
		// TODO Auto-generated method stub
		showDao.resetreserve(ticket);
		
	}

	@Override
	public List<ShowReview> findMyRevuew(int id) {
		log.info("나의 아이디" + id);
		
		return showDao.findMyReview(id);
	}

	
}
