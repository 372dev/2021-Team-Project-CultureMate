package com.kh.cm.mate.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.mate.model.vo.MateReply;

public interface MateService {

	int getMateCount();

	List<Mate> getMateList(PageInfo pageInfo);

	Mate findMateByMateId(int mateId);

	boolean updateMateCount(int mateId);

	int getMateReplyCount(int mateId);

	List<MateReply> findMateReplyByMateId(int mateId, PageInfo pageInfo);

	int saveMate(Mate mate);

	int deleteMate(int mateId);

	int saveMateReply(MateReply mateReply);
	

	

}
