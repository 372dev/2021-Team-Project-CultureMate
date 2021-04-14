package com.kh.cm.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.cs.model.vo.CsBoard;
import com.kh.cm.qna.model.dao.QnaBoardDao;
import com.kh.cm.qna.model.vo.QnaBoard;
import com.kh.cm.qna.model.vo.QnaReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDao qnaboardDao;

	@Override
	@Transactional
	public int saveqnaBoard(QnaBoard qnaboard) {
		int result =0;

		if(qnaboard.getQnaId() != 0) {
			result = qnaboardDao.updateqnaBoard(qnaboard);
		}else {
			result = qnaboardDao.insertqnaBoard(qnaboard);
		}
		return result;
	}

	@Override
	public int getqnaBoardCount() {
		
		return qnaboardDao.selectCount();
	}

	@Override
	public List<QnaBoard> getqnaBoardList() {
		
		
		return qnaboardDao.selectqnaBoardList();
	}

	@Override
	public QnaBoard findqnaBoardById(int qnaId) {

		return qnaboardDao.selectqnaBoardDetail(qnaId);
	}

	@Override
	public int getqnaReply(QnaReply qnareply) {
		
		return qnaboardDao.insertqnaReply(qnareply);
	}

	

	

	

	
	
}
