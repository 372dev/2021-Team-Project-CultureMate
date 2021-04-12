package com.kh.cm.mate.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.mate.model.vo.MateReply;

@Mapper
public interface MateDao {
	
	int selectMateCount();

	List<Mate>selectMateList(RowBounds rowBounds);

	Mate selectMateDetail(int mateId);

	boolean updateMateCount(int mateId);

	int selectReplyCount(int mateId);

	List<MateReply> selectMateReplyList(int mateId, RowBounds rowBounds);

	int updateMate(Mate mate);

	int insertMate(Mate mate);

	int deleteMate(int mateId);

	int updateMateReply(MateReply mateReply);

	int insertMateReply(MateReply mateReply);

	int deleteMateReply(int mateReplyId);

	

}
