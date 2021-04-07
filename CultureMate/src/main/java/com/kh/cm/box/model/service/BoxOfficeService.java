package com.kh.cm.box.model.service;

import java.util.List;

import com.kh.cm.box.model.vo.BoxOfficeVO;

public interface BoxOfficeService {

	int saveBO(List<BoxOfficeVO> bo);

	int truncateBO();
	
}
