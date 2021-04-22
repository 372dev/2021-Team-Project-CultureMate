package com.kh.cm.mate.model.dao;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.mate.model.vo.MateReply;

@Mapper
public interface MateDao {
	
	int selectMateCount();
	
	List<Mate>selectMateList(RowBounds rowBounds);
	
	int selectMateSearchCount(@Param("search") String search, @Param("keyword")String keyword);
	
	List<Mate> selectMateSearchList(RowBounds rowBounds, PageInfo pageInfo);
	
	List<Collection> selectPostsByUserId(RowBounds rowBounds, @Param("mateWriteId") int mateWriteId, @Param("shareWriteId") int shareWriteId);

	Mate selectMateDetail(int mateId);

	boolean updateMateCount(int mateId);

	int selectReplyCount(int mateId);

	List<MateReply> selectMateReplyList(int mateId, RowBounds rowBounds);

	int updateMate(Mate mate);

	int insertMate(Mate mate);

	int deleteMate(int mateId);

	int updateMateReply(MateReply mateReply);

	int insertMateReply(MateReply mateReply);

	int deleteMateReply(int mateReplyGroup);

	int insertMateReReply(MateReply mateReply);

	MateReply selectMateReply(int mateReplyId);

}
