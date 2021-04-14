package com.kh.cm.qna.model.dao;

import java.util.List;

import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

public interface QnaBoardDao {

	int insertqnaBoard(QnaBoard qnaboard);

	int updateqnaBoard(QnaBoard qnaboard);

	int selectCount();

	List<QnaBoard> selectqnaBoardList();

	QnaBoard selectqnaBoardDetail(int qnaId);

	int insertqnaReply(QnaReply qnareply);



}
