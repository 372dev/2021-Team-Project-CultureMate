package com.kh.cm.mkshow.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.mkshow.model.dao.ShowReviewDao;
import com.kh.cm.mkshow.model.vo.ShowReview;

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
		System.out.println("@@@@impl@@@@");
	
		return showDao.updateReview(review);
		
	}

	
}
