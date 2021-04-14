package com.kh.cm.mkshow.model.service;

import java.util.List;

import com.kh.cm.mkshow.model.vo.ShowReview;

public interface ShowReviewService  {

	List<ShowReview> getReviewList(String mt20id);

	int saveReview(ShowReview review);

	int delReview(int no);

	List<ShowReview> findReviewWriter(int no);

	int updateReview(ShowReview review);

}
