package com.kh.cm.qna.model.service;

import java.util.List;

import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

public interface QnaBoardService {

	int saveqnaBoard(QnaBoard qnaboard);

	int getqnaBoardCount();

	List<QnaBoard> getqnaBoardList();

	QnaBoard findqnaBoardById(int qnaId);

	int getqnaReply(QnaReply qnareply);

	







}
