package com.kh.cm.share.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.share.model.vo.Share;
import com.kh.cm.share.model.vo.ShareReply;

@Mapper
public interface ShareDao {

	int selectCount();

	List<Share> selectShareList(RowBounds rowBounds);
	
	int selectSearchCount(@Param("search") String search, @Param("keyword")String keyword);
	
	List<Share> selectShareSearchList(RowBounds rowBounds, PageInfo pageInfo);

	Share selectShareDetail(int shareId);

	int updateShare(Share share);

	int insertShare(Share share);

	boolean updateShareCount(int shareId);

	List<Share> selectFindShareList(String searchShare, String keyword, int start, int end);

	int deleteShare(int shareId);

	int updateShareReply(ShareReply shareReply);

	int insertShareReply(ShareReply shareReply);

	int selectReplyCount(int shareId);

	int deleteShareReply(int shareReplyId);

	List<ShareReply> selectShareReplyList(int shareId, RowBounds rowBounds);

	ShareReply selectShareReply(int shareReplyId);

	int insertShareReReply(ShareReply shareReply);

	
	

}
