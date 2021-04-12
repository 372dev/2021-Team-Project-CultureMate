package com.kh.cm.share.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.share.model.dao.ShareDao;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	private ShareDao shareDao;

	@Override
	public int getShareCount() {
		
		return shareDao.selectCount();
	}

	@Override
	public List<Share> getShareList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return shareDao.selectShareList(rowBounds);
	}

	@Override
	@Transactional
	public int saveShare(Share share) {
		int result = 0;
		
		if(share.getShareId() != 0) {
			result = shareDao.updateShare(share);
		}else {
			result = shareDao.insertShare(share);
		}
		
		return result;
	}

	@Override
	public Share findShareByShareId(int shareId) {
		return shareDao.selectShareDetail(shareId);
	}

//	@Override
//	public List<ShareReply> findShareReplyByShareId(int shareId) {
//			
//		return shareDao.selectShareReplyList(shareId);
//	}

	@Override
	public boolean updateShareCount(int shareId) {
		return shareDao.updateShareCount(shareId);
	}


	@Override
	public List<Share> getFindShare(String searchShare, String keyword, int start, int end) {
		
		return shareDao.selectFindShareList(searchShare, keyword, start, end);
	}

	@Override
	public int deleteShare(int shareId) {
	
		return shareDao.deleteShare(shareId);
	}

	@Override
	@Transactional
	public int saveShareReply(ShareReply shareReply) {
			int result = 0;
			
			if(shareReply.getShareReplyId() != 0) {
				result = shareDao.updateShareReply(shareReply);
			} else {
				result = shareDao.insertShareReply(shareReply);
			}
		return result;
	}

	@Override
	public int getShareReplyCount(int shareId) {
		
		return shareDao.selectReplyCount(shareId);
	}

	@Override
	public int deleteShareReply(int shareReplyId) {
		
		return shareDao.deleteShareReply(shareReplyId);
	}

	@Override
	public List<ShareReply> findShareReplyByShareId(int shareId, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return shareDao.selectShareReplyList(shareId,rowBounds);
	}


}
