package com.kh.cm.mkshow.model.service;

import java.util.List;

import com.kh.cm.mkshow.model.vo.ShowReview;

public interface ShowReviewService  {

	List<ShowReview> getReviewList(String mt20id);

	int saveReview(ShowReview review);

}
