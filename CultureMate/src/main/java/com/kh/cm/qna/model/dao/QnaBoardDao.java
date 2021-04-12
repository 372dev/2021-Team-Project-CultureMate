package com.kh.cm.qna.model.dao;

import java.util.List;

import com.kh.cm.qna.model.vo.QnaBoard;

public interface QnaBoardDao {


	int insertqnaBoard(QnaBoard qnaboard);

	int updateqnaBoard(QnaBoard qnaboard);

	int selectCount();

	List<QnaBoard> selectqnaBoardList();

	QnaBoard selectqnaBoardDetail(int qnaId);

}
