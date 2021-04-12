package com.kh.cm.cs.model.service;

import java.util.List;

import com.kh.cm.cs.model.vo.CsBoard;
import com.kh.mvc.common.util.PageInfo;

public interface CsBoardService {

	int saveCsBoard(CsBoard csboard);

	int getCsBoardCount();

	List<CsBoard> getCsBoardList(PageInfo pageInfo);








}
