package com.kh.cm.cs.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.cm.cs.model.vo.CsBoard;

@Mapper
public interface CsBoardDao {
	
	
	int insertCsBoard(CsBoard csboard);

	int updateCsBoard(CsBoard csboard);

	int selectCount();

	List<CsBoard> selectCsBoardList(RowBounds rowBounds);







}
