package com.kh.cm.cs.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.cm.cs.model.vo.CsBoard;

@Mapper
public interface CsBoardDao {

	int insertCsBoard(CsBoard csboard);

	int updateCsBoard(CsBoard csboard);


}
