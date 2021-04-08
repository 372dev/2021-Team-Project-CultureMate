package com.kh.cm.share.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

public interface ShareService {

	int getShareCount();

	List<Share> getShareList(PageInfo pageInfo);

	int saveShare(Share share);

	Share findShareByShareId(int shareId);

	List<ShareReply> findShareReplyByShareId(int shareId);

	boolean updateShareCount(int shareId);

	List<Share> getFindShare(String searchShare, String keyword, int start, int end);

	int deleteShare(int shareId);

	int saveShareReply(ShareReply shareReply);

	int getShareReplyCount(int shareId);

	int deleteShareReply(int shareReplyId);


	
}
