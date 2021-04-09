package com.kh.cm.cs.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.cs.model.dao.CsBoardDao;
import com.kh.cm.cs.model.vo.CsBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CsBoardServiceImpl implements CsBoardService {
	@Autowired
	private CsBoardDao csBoardDao;


	@Override
	@Transactional
	public int saveCsBoard(CsBoard csboard) {
		int result =0;

		if(csboard.getCsBoardId() != 0) {
			result = csBoardDao.updateCsBoard(csboard);
		}else {
			result = csBoardDao.insertCsBoard(csboard);
		}
		return result;
	}

}
