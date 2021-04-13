package com.kh.cm.cs.model.service;

import java.util.List;

import com.kh.cm.common.util.PageInfo;
import com.kh.cm.cs.model.vo.CsBoard;


public interface CsBoardService {

	int saveCsBoard(CsBoard csboard);

	int getCsBoardCount();

	List<CsBoard> getCsBoardList(PageInfo pageInfo);








}
