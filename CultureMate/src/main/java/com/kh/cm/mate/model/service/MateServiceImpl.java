package com.kh.cm.mate.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.mate.model.dao.MateDao;
import com.kh.cm.mate.model.vo.Mate;
import com.kh.cm.mate.model.vo.MateReply;

@Service
public class MateServiceImpl implements MateService {
	
	@Autowired
	private MateDao mateDao;

	@Override
	public int getMateCount() {
		
		return mateDao.selectMateCount();
	}

	@Override
	public List<Mate> getMateList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mateDao.selectMateList(rowBounds);
	}

	@Override
	public Mate findMateByMateId(int mateId) {
		return mateDao.selectMateDetail(mateId);
	}

	@Override
	public boolean updateMateCount(int mateId) {
		return mateDao.updateMateCount(mateId);
	}

	@Override
	public int getMateReplyCount(int mateId) {
		return mateDao.selectReplyCount(mateId);
	}

	@Override
	public List<MateReply> findMateReplyByMateId(int mateId, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mateDao.selectMateReplyList(mateId,rowBounds);
	}

	@Override
	public int saveMate(Mate mate) {
		int result = 0;
		
		if(mate.getMateId() != 0) {
			result = mateDao.updateMate(mate);
		}else {
			result = mateDao.insertMate(mate);
		}
		
		return result;
	}

	@Override
	public int deleteMate(int mateId) {
		
		return mateDao.deleteMate(mateId);
	}

	@Override
	public int saveMateReply(MateReply mateReply) {
		int result = 0;
		
		if(mateReply.getMateReplyId() != 0) {
			result = mateDao.updateMateReply(mateReply);
		} else {
			result = mateDao.insertMateReply(mateReply);
		}
	return result;
		
	}

}
