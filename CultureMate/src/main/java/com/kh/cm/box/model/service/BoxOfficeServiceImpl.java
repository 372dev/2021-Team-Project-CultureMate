package com.kh.cm.box.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.cm.box.model.dao.BoxOfficeDAO;
import com.kh.cm.box.model.vo.BoxOfficeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoxOfficeServiceImpl implements BoxOfficeService {
	@Autowired
	private BoxOfficeDAO boxOfficeDAO;

	@Override
	@Transactional
	public int saveBO(List<BoxOfficeVO> bo) {
		log.info("run writeBO");
		return boxOfficeDAO.writeBO(bo);
	}

	@Override
	public int truncateBO() {
		log.info("run truncateBO");
		return boxOfficeDAO.truncateBO();
	}

	@Override
	public List<BoxOfficeVO> getBOList(String cate) {
		log.info("run getBOList");
		return boxOfficeDAO.readBO(cate);
	}

}
