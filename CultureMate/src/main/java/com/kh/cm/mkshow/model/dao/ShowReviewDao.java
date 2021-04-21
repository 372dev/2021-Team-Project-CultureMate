package com.kh.cm.mkshow.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.mkshow.model.vo.ShowReview;
import com.kh.cm.ticket.model.vo.Ticket;

@Mapper
public interface ShowReviewDao {

	List<ShowReview> selectReviewList(@Param("mt20id") String mt20id);

	int saveReview(ShowReview review);

	int delReview(int no);

	List<ShowReview> findUserNick(int no);

	int updateReview(ShowReview review);

	int countReview(String mt20id);

	int setreserve(Ticket ticket);

	void resetreserve(Ticket ticket);

	String getreserve(ShowReview review);

	List<ShowReview> findMyReview(int id);
	
}
