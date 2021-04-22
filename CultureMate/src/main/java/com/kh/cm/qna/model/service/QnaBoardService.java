package com.kh.cm.qna.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

public interface QnaBoardService {

	int saveqnaBoard(QnaBoard qnaboard);

	int getqnaBoardCount();

	List<QnaBoard> getqnaBoardList(PageInfo pageInfo);

	QnaBoard findqnaBoardById(int qnaId);

//	int saveqnaReBoard(QnaReply qnareply);

	int addreply(QnaReply qnareply);

	int deleteQna(int qnaId);

//	List<QnaReply> getqnaReplyList(int qnaId);



	

}
