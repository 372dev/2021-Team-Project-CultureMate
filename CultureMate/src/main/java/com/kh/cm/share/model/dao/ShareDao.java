package com.kh.cm.share.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

@Mapper
public interface ShareDao {

	int selectCount();

	List<Share> selectShareList(RowBounds rowBounds);

	Share selectShareDetail(int shareId);

	int updateShare(Share share);

	int insertShare(Share share);

	List<ShareReply> selectShareReplyList(int shareId);

	boolean updateShareCount(int shareId);

	List<Share> selectFindShareList(String searchShare, String keyword, int start, int end);

	int deleteShare(int shareId);

}
