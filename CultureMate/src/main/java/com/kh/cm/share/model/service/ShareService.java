package com.kh.cm.share.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.share.model.vo.Share;

public interface ShareService {

	int getShareCount();

	List<Share> getShareList(PageInfo pageInfo);

	int saveShare(Share share);

	Share findShareByShareId(int shareId);

}
