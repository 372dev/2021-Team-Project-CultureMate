package com.kh.cm.cs.model.service;

import java.util.List;


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
	private CsBoardDao csboardDao;


	@Override
	@Transactional
	public int saveCsBoard(CsBoard csboard) {
		int result =0;

		if(csboard.getCsboardId() != 0) {
			result = csboardDao.updateCsBoard(csboard);
		}else {
			result = csboardDao.insertCsBoard(csboard);
		}
		return result;
	}


	@Override
	public int getCsBoardCount() {
		
		return csboardDao.selectCount();
	}


	@Override
	public List<CsBoard> getCsBoardList() {
		
		return csboardDao.selectCsBoardList();
	}


	@Override
	public int getnoticeBoardCount() {
		
		return csboardDao.selectnoticeCount();
	}


	@Override
	public List<CsBoard> getnoticeBoardList() {
		
		return csboardDao.selectnoticeList();
	}





	}

	





