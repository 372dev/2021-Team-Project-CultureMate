package com.kh.cm.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

public interface QnaBoardDao {

	int insertqnaBoard(QnaBoard qnaboard);

	int updateqnaBoard(QnaBoard qnaboard);

	int selectCount();

	List<QnaBoard> selectqnaBoardList(RowBounds rowBounds);

	QnaBoard selectqnaBoardDetail(int qnaId);

	int insertqnaReply(QnaReply qnareply);

	int deleteQna(int qnaId);

	List<QnaReply> selectqnaReplyList(int qnaId);

	int insertQnaReply(QnaReply qnareply);

	int delReply(int qnaReId);

	List<QnaReply> findUserId(int no);

	int countReply(int replyWriterNo);







}
