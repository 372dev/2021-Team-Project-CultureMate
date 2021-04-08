package com.kh.cm.mkshow.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.cm.mkshow.model.vo.ShowReview;

@Mapper
public interface ShowReviewDao {

	List<ShowReview> selectReviewList(@Param("mt20id") String mt20id);

	int saveReview(ShowReview review);

}
