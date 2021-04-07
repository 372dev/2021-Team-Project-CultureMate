package com.kh.cm.box.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.cm.box.model.vo.BoxOfficeVO;

@Mapper
public interface BoxOfficeDAO {

	int writeBO(List<BoxOfficeVO> BoxOfficeVO);

	void truncateBO();
	
}
